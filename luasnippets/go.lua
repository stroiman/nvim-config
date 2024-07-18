return {
  s("eno", fmt("Expect(err).ToNot(HaveOccurred()){}", { i(0) })),
  s("desc", fmta('Describe("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("it", fmta('It("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("bef", fmta("<>(func() {\n  <>\n})", { c(1, { t("BeforeEach"), t("BeforeAll") }), i(0) })),
  s("aft", fmta("<>(func() {\n  <>\n})", { c(1, { t("AfterEach"), t("AfterAll") }), i(0) })),
  s("fn", fmta("func <>(<>) <> {\n  <>\n}", { i(1), i(2), i(3), i(0) })),
}
