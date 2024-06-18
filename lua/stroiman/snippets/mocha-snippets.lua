local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- ls.add_snippets("javascript", {
-- 	s("des", fmt('describe("{}", () => {\n{}\n})', { i(1), i(2) })),
-- 	s("ctx", fmt('context("{}", () => {\n{}\n})', { i(1), i(2) })),
-- 	s("it", fmt('it("{}", () => {\n{}\n})', { i(1), i(2) })),
-- 	s("ita", fmt('it("{}", async () => {\n{}\n})', { i(1), i(2) })),
-- 	s("bef", fmt('beforeEach("{}", () => {\n{}\n})', { i(1), i(2) })),
-- 	s("befa", fmt('beforeEach("{}", async () => {\n{}\n})', { i(1), i(2) })),
-- 	s("aft", fmt('afterEach("{}", () => {\n{}\n})', { i(1), i(2) })),
-- 	s("afta", fmt('afterEach("{}", async () => {\n{}\n})', { i(1), i(2) })),
-- })
