return {
  s("h1", fmt("<h1>{}</h1>\n{}", { i(1), i(0) })),
  s(
    "t",
    fmt("<{}>{}</{}>\n{}", {
      i(1),
      i(2),
      f(function(args)
        return vim.split(args[1][1], " ")[1] or ""
      end, { 1 }),
      i(0),
    })
  ),
  -- s("main", fmt("<m>{}</h1>\n{}", { i(1), i(0) })),
}
