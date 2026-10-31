
//==========    this is the complete power query or m-language code for the clean and process 


let
    Source = Sql.Database("MrSanu", "jobdata"),
    dbo_job_postings1 = Source{[Schema="dbo",Item="job_postings1"]}[Data],
    #"Merged Queries" = Table.NestedJoin(dbo_job_postings1, {"job_link"}, job_skills1, {"job_link"}, "job_skills1", JoinKind.LeftOuter),
    #"Expanded job_skills1" = Table.ExpandTableColumn(#"Merged Queries", "job_skills1", {"job_skills"}, {"job_skills1.job_skills"}),
    #"Renamed Columns" = Table.RenameColumns(#"Expanded job_skills1",{{"job_skills1.job_skills", "job skills"}}),
    #"Merged Queries1" = Table.NestedJoin(#"Renamed Columns", {"job_link"}, job_summary1, {"job_link"}, "job_summary1", JoinKind.LeftOuter),
    #"Expanded job_summary1" = Table.ExpandTableColumn(#"Merged Queries1", "job_summary1", {"job_summary"}, {"job_summary1.job_summary"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Expanded job_summary1",{{"job_summary1.job_summary", "summary"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns1",{"last_status", "got_summary", "got_ner", "is_being_worked", "search_city", "search_position"}),
    #"Extracted Text After Delimiter" = Table.TransformColumns(#"Removed Columns", {{"job_link", each Text.AfterDelimiter(_, "-", {0, RelativePosition.FromEnd}), type text}}),
    #"Renamed Columns2" = Table.RenameColumns(#"Extracted Text After Delimiter",{{"job_link", "job id"}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Renamed Columns2",{"last_processed_time"}),
    #"Renamed Columns3" = Table.RenameColumns(#"Removed Columns1",{{"first_seen", "job posting date"}}),
    #"Removed Duplicates" = Table.Distinct(#"Renamed Columns3", {"job id"}),
    #"Renamed Columns4" = Table.RenameColumns(#"Removed Duplicates",{{"company", "company name"}, {"job skills", "job_skills"}}),
    #"Appended Query" = Table.Combine({#"Renamed Columns4", postings3}),
    #"Added Custom" = Table.AddColumn(#"Appended Query", "job_emplynment_type", each 
  if [summary] = null then "Not Specified"
  else if Text.Contains([summary], "full time", Comparer.OrdinalIgnoreCase) or Text.Contains([summary], "full-time", Comparer.OrdinalIgnoreCase) then "Full Time"
  else if Text.Contains([summary], "part time", Comparer.OrdinalIgnoreCase) or Text.Contains([summary], "part-time", Comparer.OrdinalIgnoreCase) then "Part Time"
  else if Text.Contains([summary], "contract", Comparer.OrdinalIgnoreCase) then "Contract"
  else if Text.Contains([summary], "internship", Comparer.OrdinalIgnoreCase) then "Internship"
  else if Text.Contains([summary], "temporary", Comparer.OrdinalIgnoreCase) then "Temporary"
  else if Text.Contains([summary], "freelance", Comparer.OrdinalIgnoreCase) then "Freelance"
  else if Text.Contains([summary], "permanent", Comparer.OrdinalIgnoreCase) then "Permanent"
  else "Not Specified"),
    #"Added Custom1" = Table.AddColumn(#"Added Custom", "job_field", each if Text.Contains(Text.Lower([job_title]), "business analyst") 
    or Text.Contains(Text.Lower([job_title]), "ba") 
    or Text.Contains(Text.Lower([job_title]), "business intelligence analyst") 
    or Text.Contains(Text.Lower([job_title]), "business intelligence") then "Business Analyst" 

  else if Text.Contains(Text.Lower([job_title]), "cloud engineer") 
    or Text.Contains(Text.Lower([job_title]), "cloud architect") 
    or Text.Contains(Text.Lower([job_title]), "cloud specialist") 
    or Text.Contains(Text.Lower([job_title]), "devops engineer") 
    or Text.Contains(Text.Lower([job_title]), "cloud data") then "Cloud Engineer" 

  else if Text.Contains(Text.Lower([job_title]), "data analyst") 
    or Text.Contains(Text.Lower([job_title]), "reporting analyst") 
    or Text.Contains(Text.Lower([job_title]), "bi analyst") 
    or Text.Contains(Text.Lower([job_title]), "analytics specialist") 
    or Text.Contains(Text.Lower([job_title]), "insights analyst") 
    or Text.Contains(Text.Lower([job_title]), "mis analyst") 
    or Text.Contains(Text.Lower([job_title]), "data visualization analyst")
    or Text.Contains(Text.Lower([job_title]), "data analytics consultant")
    or Text.Contains(Text.Lower([job_title]), "data & analytics partner") 
    or Text.Contains(Text.Lower([job_title]), "data insights consultant") then "Data Analyst" 

  else if Text.Contains(Text.Lower([job_title]), "data engineer") 
    or Text.Contains(Text.Lower([job_title]), "etl developer") 
    or Text.Contains(Text.Lower([job_title]), "data architect") 
    or Text.Contains(Text.Lower([job_title]), "big data engineer") 
    or Text.Contains(Text.Lower([job_title]), "data warehouse engineer") 
    or Text.Contains(Text.Lower([job_title]), "database engineer") 
    or Text.Contains(Text.Lower([job_title]), "database specialist") 
    or Text.Contains(Text.Lower([job_title]), "datacenter technician") then "Data Engineer" 

  else if Text.Contains(Text.Lower([job_title]), "data scientist") 
    or Text.Contains(Text.Lower([job_title]), "machine learning scientist") 
    or Text.Contains(Text.Lower([job_title]), "ai specialist") 
    or Text.Contains(Text.Lower([job_title]), "research scientist") 
    or Text.Contains(Text.Lower([job_title]), "predictive analyst") 
    or Text.Contains(Text.Lower([job_title]), "statistical analyst") 
    or Text.Contains(Text.Lower([job_title]), "quantitative analyst") 
    or Text.Contains(Text.Lower([job_title]), "artificial intelligence") then "Data Scientist" 

  else if Text.Contains(Text.Lower([job_title]), "machine learning engineer") 
    or Text.Contains(Text.Lower([job_title]), "ml engineer") 
    or Text.Contains(Text.Lower([job_title]), "ai engineer") 
    or Text.Contains(Text.Lower([job_title]), "deep learning engineer") then "Machine Learning Engineer" 

  else if Text.Contains(Text.Lower([job_title]), "senior data analyst") 
    or Text.Contains(Text.Lower([job_title]), "lead data analyst") 
    or Text.Contains(Text.Lower([job_title]), "principal data analyst") 
    or Text.Contains(Text.Lower([job_title]), "data analytics manager") 
    or Text.Contains(Text.Lower([job_title]), "data & analytics manager") 
    or Text.Contains(Text.Lower([job_title]), "data and analytics lead") 
    or Text.Contains(Text.Lower([job_title]), "data and finance officer") 
    or Text.Contains(Text.Lower([job_title]), "data and insights lead") 
    or Text.Contains(Text.Lower([job_title]), "database analyst senior") then "Senior Data Analyst" 

  else if Text.Contains(Text.Lower([job_title]), "senior data engineer") 
    or Text.Contains(Text.Lower([job_title]), "lead data engineer") 
    or Text.Contains(Text.Lower([job_title]), "principal data engineer") 
    or Text.Contains(Text.Lower([job_title]), "data engineering manager") 
    or Text.Contains(Text.Lower([job_title]), "database specialist") 
    or Text.Contains(Text.Lower([job_title]), "database administrator") 
    or Text.Contains(Text.Lower([job_title]), "data governance lead") 
    or Text.Contains(Text.Lower([job_title]), "data governance manager") 
    or Text.Contains(Text.Lower([job_title]), "data manager") then "Senior Data Engineer" 

  else if Text.Contains(Text.Lower([job_title]), "senior data scientist") 
    or Text.Contains(Text.Lower([job_title]), "lead data scientist") 
    or Text.Contains(Text.Lower([job_title]), "principal data scientist") 
    or Text.Contains(Text.Lower([job_title]), "data science manager") then "Senior Data Scientist" 

  else if Text.Contains(Text.Lower([job_title]), "software engineer") 
    or Text.Contains(Text.Lower([job_title]), "software developer") 
    or Text.Contains(Text.Lower([job_title]), "backend developer") 
    or Text.Contains(Text.Lower([job_title]), "frontend developer") 
    or Text.Contains(Text.Lower([job_title]), "full stack developer") 
    or Text.Contains(Text.Lower([job_title]), "application developer") then "Software Engineer" 

  else "No Clear Specifications"),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom1",{"job id", "job_title", "job_field", "company name", "job_location", "job posting date", "job_level", "job_type", "job_skills", "summary", "job_emplynment_type"}),
    #"Filtered Rows" = Table.SelectRows(#"Reordered Columns", each true),
    #"Renamed Columns5" = Table.RenameColumns(#"Filtered Rows",{{"job id", "job_id"}, {"company name", "company_name"}, {"job posting date", "job_posting_date"}}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Renamed Columns5",{"job_id", "job_title", "job_field", "company_name", "job_location", "job_posting_date", "job_level", "job_type", "job_skills", "job_emplynment_type", "summary"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Reordered Columns1",{{"job_posting_date", type date}}),
    #"Appended Query1" = Table.Combine({#"Changed Type", final_dataframe}),
    #"Filtered Rows1" = Table.SelectRows(#"Appended Query1", each true),
    #"Removed Columns2" = Table.RemoveColumns(#"Filtered Rows1",{"search_country"}),
    #"Inserted Text After Delimiter" = Table.AddColumn(#"Removed Columns2", "Text After Delimiter", each Text.AfterDelimiter([job_location], ",", {0, RelativePosition.FromEnd}), type text),
    #"Capitalized Each Word" = Table.TransformColumns(#"Inserted Text After Delimiter",{{"Text After Delimiter", Text.Proper, type text}}),
    #"Trimmed Text" = Table.TransformColumns(#"Capitalized Each Word",{{"Text After Delimiter", Text.Trim, type text}}),
    #"Renamed Columns6" = Table.RenameColumns(#"Trimmed Text",{{"Text After Delimiter", "country"}})
in
    #"Renamed Columns6"