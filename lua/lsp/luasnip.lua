local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local date = function() return {os.date('%Y-%m-%d')} end
local function copy(args)
	return args[1]
end

ls.add_snippets(nil,{
    all = {
        s({
            trig = "todo",
            namr = "ToDo",
            dscr = "ToDo YYYY-MM-DD",
        }, {
            t("/* TODO: "),
            f(date, {}),
            t(" */"),
        }),
        s("fn", {
            -- Simple static text.
            t("//Parameters: "),
            f(copy, 2),
            t({ "", "function " }),
            -- Placeholder/Insert.
            i(1),
            t("("),
            i(2, "int foo"),
            t({ ") {", "\t" }),
            i(0),
            t({ "", "}" }),
        }),
        s("if", {
            t("if (a == 0)"),
            t({ "", "{" }),
            t({ "", "}" }),
        }),
        s("switch", {
            t("switch (cnt)"),
            t({"","{" }),
            t({"","    case a:"}),
            t({"","    break;"}),
            t({"","    default:"}),
            t({"","    break;"}),
            t({"","}" }),
        }),
        s(
		"fmt1",
		fmt("To {title} {} {}.", {
			i(2, "Name"),
			i(3, "Surname"),
			title = c(1, { t("Mr."), t("Ms.") }),
		})
	),
	-- To escape delimiters use double them, e.g. `{}` -> `{{}}`.
	-- Multi-line format strings by default have empty first/last line removed.
	-- Indent common to all lines is also removed. Use the third `opts` argument
	-- to control this behaviour.
	s(
		"fmt2",
		fmt(
			[[
		foo({1}, {3}) {{
			return {2} * {4}
		}}
		]],
			{
				i(1, "x"),
				rep(1),
				i(2, "y"),
				rep(2),
			}
		)
	),
	-- Empty placeholders are numbered automatically starting from 1 or the last
	-- value of a numbered placeholder. Named placeholders do not affect numbering.
	s(
		"fmt3",
		fmt("{} {a} {} {1} {}", {
			t("1"),
			t("2"),
			a = t("A"),
		})
	),
	-- The delimiters can be changed from the default `{}` to something else.
	s("fmt4", fmt("foo() { return []; }", i(1, "x"), { delimiters = "[]" })),
	-- `fmta` is a convenient wrapper that uses `<>` instead of `{}`.
	s("fmt5", fmta("foo() { return <>; }", i(1, "x"))),
	-- By default all args must be used. Use strict=false to disable the check
	s(
		"fmt6",
		fmt("use {} only", { t("this"), t("not this") }, { strict = false })
	),
	-- Use a dynamic_node to interpolate the output of a
	-- function (see date_input above) into the initial
	-- value of an insert_node.
	s("novel", {
		t("It was a dark and stormy night on "),
		d(1, date_input, {}, { user_args = { "%A, %B %d of %Y" } }),
		t(" and the clocks were striking thirteen."),
	}),
    },
})
