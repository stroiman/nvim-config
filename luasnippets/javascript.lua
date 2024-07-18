return {
  -- General
  s("fa", fmt("({}) => {{{}}}", { i(1), i(0) })),
  s("req", fmt('const {} = require ("{}");', { i(1), rep(1) })),
  s(
    "imp",
    fmt('import {} from "{}";', {
      c(2, {
        f(function(arg)
          return arg[1][1]
        end, { 1 }),
        f(function(arg)
          return "{ " .. arg[1][1] .. " }"
        end, { 1 }),
        i(1),
      }),
      i(1),
    })
  ),
  s("if", fmta("if (<>) {\n  <>\n}", { i(1), i(0) })),
  -- express
  s("get", fmt('get("{}", (req, res) => {{\n  {}\n}})', { i(1), i(0) })),
  s(
    "use",
    fmt("use(({}) => {{\n  {}\n}})", { c(1, {
      t("req, res, next"),
      t("err, req, res, next"),
    }), i(0) })
  ),
  -- Mocha
  s("des", fmt('describe("{}", () => {{\n  {}\n}})', { i(1), i(2) })),
  s("ctx", fmt('context("{}", () => {{\n{}\n}})', { i(1), i(2) })),
  s(
    "it",
    fmt('it("{}", {} => {{\n  {}\n}})', { i(1), c(2, {
      t("()"),
      t("async ()"),
    }), i(0) })
  ),
  s("ita", fmt('it("{}", async () => {{\n{}\n}})', { i(1), i(2) })),
  s("bef", fmt("beforeEach({} => {{\n{}\n}})", { c(1, { t("()"), t("async ()") }), i(0) })),
  s("aft", fmt("afterEach({} => {{\n  {}\n}})", { c(1, { t("()"), t("async ()") }), i(0) })),
  s("before", fmt("before({} => {{\n{}\n}})", { c(1, { t("()"), t("async ()") }), i(0) })),
  s("after", fmt("after({} => {{\n{}\n}})", { c(1, { t("()"), t("async ()") }), i(0) })),
  -- Chai
  s("exp", fmt("expect({}).to.{}", { i(1), i(2) })),
  -- express
  s(
    "router",
    fmt('import express from "express"\n\nconst router = express.Router()\n\n{}\n\nexport default router;\n', { i(0) })
  ),
  -- branching
  s("if", fmta("if (<>) {\n  <>\n}", { i(1), i(0) })),
  -- eslint
  s("ednl", fmt("// eslint-disable-next-line", {})),
}
