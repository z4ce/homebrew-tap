class SnykAutocomplete < Formula
  desc "Shell completion scripts for Snyk CLI"
  homepage "https://github.com/z4ce/snyk-autocomplete"
  url "https://github.com/z4ce/snyk-autocomplete/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "4858d32d3852934000b7faf13713af8955fa3e203703a6a1979b4666bb57b6be"
  license "MIT"
  head "https://github.com/z4ce/snyk-autocomplete.git", branch: "main"

  depends_on "snyk"

  def install
    bash_completion.install "bash/snyk.bash" => "snyk"
    zsh_completion.install "zsh/_snyk"
    fish_completion.install "fish/snyk.fish"
  end

  test do
    assert_match "snyk", shell_output("bash -c 'source #{bash_completion}/snyk && complete -p snyk'")
  end
end 
