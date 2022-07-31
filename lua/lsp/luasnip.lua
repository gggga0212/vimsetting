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
    },
})
