-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
ls.add_snippets('tex', {
  s(
    { trig = 'env', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s(
    { trig = 'ff', dscr = "Expands 'ff' into '\\frac{}{}'" },
    fmt(
      '\\frac{<>}{<>}',
      {
        i(1),
        i(2),
      },
      { delimiters = '<>' } -- manually specifying angle bracket delimiters
    )
  ),
  -- Equation
  s(
    { trig = 'eq', dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
      { i(1) }
    )
  ),
  -- left/right bracket
  s(
    { trig = 'lrb', dscr = "Expands 'lrb' into a left and right bracket" },
    fmta('\\left\\{ <> \\right\\}', {
      i(1),
    })
  ),
  -- proof by induction
  s(
    { trig = 'ind', dscr = "Expands 'ind' into a base case and inductive hypotheis" },
    fmta(
      [[
        \begin{itemize}[label=$<>$]
          \item  \emph{Base Case:} <>
          \item \emph{Induction Step:} <>
        \end{itemize}
      ]],
      { i(1), i(2), i(2) },
      { delimiters = '<>' }
    )
  ),
  -- theorem-like environments
  s(
    { trig = 'thm', dscr = 'Theorem environment' },
    fmta(
      [[
      \begin{theorem}<>
          <>
      \end{theorem}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'prop', dscr = 'Proposition environment' },
    fmta(
      [[
      \begin{prop}<>
          <>
      \end{prop}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'lem', dscr = 'Lemma environment' },
    fmta(
      [[
      \begin{lemma}<>
        <>
      \end{lemma}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'defn', dscr = 'Definition environment' },
    fmta(
      [[
      \begin{definition}<>
          <>
      \end{definition}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'eg', dscr = 'Example environment' },
    fmta(
      [[
      \begin{eg}<>
          <>
      \end{eg}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'ex', dscr = 'exercise environment' },
    fmta(
      [[
      \begin{ex}<>
          <>
      \end{ex}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'corr', dscr = 'corrolary environment' },
    fmta(
      [[
      \begin{corrolary} <>
        <>
      \end{corrolary}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'rem', dscr = 'Remark environment (unnumbered)' },
    fmta(
      [[
      \begin{remark}<>
          <>
      \end{remark}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'note', dscr = 'note environment' },
    fmta(
      [[
      \begin{note}<>
        <>
      \end{note}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = 'qst', dscr = 'Question environment' },
    fmta(
      [[
      \begin{question}<>
          <>
      \end{question}
      ]],
      { i(1), i(0) }
    )
  ),
  -- templates
  s(
    { trig = 'tmphw', dscr = 'Creates a homework template starting point' },
    fmta(
      [[
    \documentclass[11pt]{article}
    \input{<>/preamble}
    \input{<>/macros}
    \input{<>/letterfonts}
    
    \begin{document}
    \hwheader{<>}{Homework <>}
    
    <>
    \end{document}
    ]],
      { i(1, 'tex_settings'), rep(1), rep(1), i(2, 'Math 130C'), i(3, '1'), i(0) },
      { delimiters = '<>' }
    )
  ),
})
