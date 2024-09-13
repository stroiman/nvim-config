return {
  s("eno", fmt("Expect(err).ToNot(HaveOccurred()){}", { i(0) })),
  -- s("exp", fmt("Expect({}).{}({})", { i(1), c(2, { t("To"), t("ToNot") }), i(0) })),
  postfix({
    trig = ".exp",
    -- Probably need to be improved
    match_pattern = "[%w%.%(%)]+$",
  }, {
    d(1, function(_, parent)
      return sn(
        nil,
        fmt("Expect({}).{}({})", {
          t(parent.snippet.env.POSTFIX_MATCH),
          c(1, { t("To"), t("ToNot") }),
          i(2),
        })
      )
      -- return fmt("Expect({}).{}({})", { t(parent.snippet.env.POSTFIX_MATCH), c(1, { t("To"), t("ToNot") }), i(0) })
    end),
  }),
  s("desc", fmta('Describe("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("it", fmta('It("<>", func() {\n  <>\n})', { i(1), i(0) })),
  s("bef", fmta("<>(func() {\n  <>\n})", { c(1, { t("BeforeEach"), t("BeforeAll") }), i(0) })),
  s("aft", fmta("<>(func() {\n  <>\n})", { c(1, { t("AfterEach"), t("AfterAll") }), i(0) })),
  s("fn", fmta("func <>(<>) <> {\n  <>\n}", { i(1), i(2), i(3), i(0) })),

  s(
    "for",
    fmta("for <> := range <> {\n  <>\n}", {
      c(1, {
        sn(1, fmta("<>, <>", { i(1, "i"), i(2) })),
        sn(1, fmta("<>", { i(1) })),
      }),
      i(2),
      i(0),
    })
  ),
}
