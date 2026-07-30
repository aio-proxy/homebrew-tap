require "minitest/autorun"
require_relative "update-formula"

class UpdateFormulaTest < Minitest::Test
  def test_update_leaves_formula_unchanged_when_a_download_fails
    formula_path = FormulaUpdater::FORMULA_PATH
    original = File.binread(formula_path)
    download = lambda do |package, _version|
      raise "download failed" if package == FormulaUpdater::PACKAGES.last

      package.length.to_s(16).rjust(64, "0")
    end

    assert_respond_to FormulaUpdater, :update
    FormulaUpdater.stub(:download_checksum, download) do
      assert_raises(RuntimeError) { FormulaUpdater.update("9.8.7") }
    end
    assert_equal original, File.binread(formula_path)
  ensure
    File.binwrite(formula_path, original) if original
  end

  def test_render_contains_every_platform_and_install_contract
    checksums = FormulaUpdater::PACKAGES.to_h do |package|
      [package, package.length.to_s(16).rjust(64, "0")]
    end

    formula = FormulaUpdater.render("9.8.7", checksums)

    assert_equal 4, formula.scan('-9.8.7.tgz"').length
    assert_equal 4, formula.scan(/^\s+url /).length
    assert_equal 4, formula.scan(/^\s+sha256 "[0-9a-f]{64}"$/).length
    FormulaUpdater::PACKAGES.each do |package|
      assert_includes formula, FormulaUpdater.tarball_url(package, "9.8.7")
      assert_includes formula, checksums.fetch(package)
    end
    assert_includes formula, 'bin.install "bin/aio-proxy"'
    assert_includes formula, 'shell_output("#{bin}/aio-proxy --version")'
  end
end
