function Div(div)
  -- Check if this is our special proof div
  if div.classes:includes("boxed-proof") then
    -- Get the title from the attribute, or default to "Proof"
    local title = div.attributes.title or "Proof"

    -- Create the title element, e.g., pandoc.Para(<strong>Proof.</strong>)
    local title_element = pandoc.Para(
      pandoc.Strong( pandoc.Str(title .. ".") )
    )

    -- Create the QED symbol element
    local qed_symbol = pandoc.Str("∎") -- The "end of proof" character
    local qed_element = pandoc.Div(pandoc.Para(qed_symbol), pandoc.Attr("", {"qed"}))

    -- Add the title to the beginning of the div's content
    div.content:insert(1, title_element)
    -- Add the QED symbol to the end
    div.content:insert(qed_element)

    return div
  end
end