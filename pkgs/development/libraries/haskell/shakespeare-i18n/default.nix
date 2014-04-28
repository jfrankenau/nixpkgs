{ cabal, shakespeare }:

cabal.mkDerivation (self: {
  pname = "shakespeare-i18n";
  version = "1.1.0";
  sha256 = "0ahhg9r7d8kdxn0x33bp5p8wmwkh1yvdqhw05yjwif0ky5y9h625";
  buildDepends = [ shakespeare ];
  meta = {
    homepage = "http://www.yesodweb.com/book/shakespearean-templates";
    description = "A type-based approach to internationalization. (deprecated)";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
