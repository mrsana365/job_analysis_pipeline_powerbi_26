
// --------- m language code   job tittle ----------------------


if Text.Contains(Text.Lower([JOB_TITLE]), "business analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "ba") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "business intelligence analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "business intelligence") then "Business Analyst" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "cloud engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "cloud architect") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "cloud specialist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "devops engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "cloud data") then "Cloud Engineer" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "data analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "reporting analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "bi analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "analytics specialist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "insights analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "mis analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data visualization analyst")
    or Text.Contains(Text.Lower([JOB_TITLE]), "data analytics consultant")
    or Text.Contains(Text.Lower([JOB_TITLE]), "data & analytics partner") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data insights consultant") then "Data Analyst" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "data engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "etl developer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data architect") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "big data engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data warehouse engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "database engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "database specialist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "datacenter technician") then "Data Engineer" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "data scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "machine learning scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "ai specialist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "research scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "predictive analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "statistical analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "quantitative analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "artificial intelligence") then "Data Scientist" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "machine learning engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "ml engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "ai engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "deep learning engineer") then "Machine Learning Engineer" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "senior data analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "lead data analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "principal data analyst") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data analytics manager") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data & analytics manager") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data and analytics lead") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data and finance officer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data and insights lead") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "database analyst senior") then "Senior Data Analyst" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "senior data engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "lead data engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "principal data engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data engineering manager") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "database specialist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "database administrator") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data governance lead") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data governance manager") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data manager") then "Senior Data Engineer" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "senior data scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "lead data scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "principal data scientist") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "data science manager") then "Senior Data Scientist" 

  else if Text.Contains(Text.Lower([JOB_TITLE]), "software engineer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "software developer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "backend developer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "frontend developer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "full stack developer") 
    or Text.Contains(Text.Lower([JOB_TITLE]), "application developer") then "Software Engineer" 

  else "No Clear Specifications"