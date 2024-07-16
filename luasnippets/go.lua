return {
  s("eno", fmt("Expect(err).ToNot(HaveOccurred()){}", { i(0) })),
  s("desc", fmta('Describe("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("it", fmta('It("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("fn", fmta("func <>(<>) <> {\n  <>\n}", { i(1), i(2), i(3), i(0) })),
}
