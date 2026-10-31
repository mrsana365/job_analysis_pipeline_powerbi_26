
// ---------------------  m language code for the replace tittel -----------------

= Table.AddColumn(#"Replaced Value1", "Custom", each if Text.Contains([job_title], "senior", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "lead", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "head", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "principal", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "chief", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "director", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "vp", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "manager", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "executive", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "III", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "architect", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "consultant", Comparer.OrdinalIgnoreCase) then "Mid senior"
else if Text.Contains([job_title], "partner", Comparer.OrdinalIgnoreCase) then "Mid senior"
else "Associate")