
// ---- m languagr code for summery -------------------------------

if Text.Contains([SUMMARY], "full-time", Comparer.OrdinalIgnoreCase) then "Full-Time"

  else if Text.Contains([SUMMARY], "part-time", Comparer.OrdinalIgnoreCase) then "Part-Time"

  else if Text.Contains([SUMMARY], "contract", Comparer.OrdinalIgnoreCase) then "Contract"

  else if Text.Contains([SUMMARY], "internship", Comparer.OrdinalIgnoreCase) then "Internship"

  else if Text.Contains([SUMMARY], "temporary", Comparer.OrdinalIgnoreCase) then "Temporary"

  else if Text.Contains([SUMMARY], "freelance", Comparer.OrdinalIgnoreCase) then "Freelance"

  else if Text.Contains([SUMMARY], "permanent", Comparer.OrdinalIgnoreCase) then "Permanent"
  
  else "Not Specified"