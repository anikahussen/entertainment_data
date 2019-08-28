##Query with Pandas

import pandas as pd 

def Bechdel_Query ():
    file_name = "bechdel_data.csv"
    bd=pd.read_csv(file_name,sep=',',encoding='utf-8') 
    # Shape of File 
    #Rows calculation
    num_rows = bd.shape[0]
    #Columns calculation
    num_cols = bd.shape[1]
    #Printing out amount of rows and columns
    print("Number of Row: ", num_rows)
    print("Number of Columns: ", num_cols)
    print()
    
    
    print("Movie titles that Passed the Bechdel Test")
    #Finding all movies with a binary value of pass 
    bechdel_approved = bd.loc[(bd["binary"]=="PASS")]
    print(bechdel_approved[["title"]])
    print()
    
    print("Year, Movie titles, Bechdel results in the 2010s")
    #Finding all movies from 2010 to 2013
    decade10= bd.loc[(bd["year"]>=2010) & (bd["year"]<=2013)]
    print(decade10[["year","title","binary"]])
    print()
    
    print("Year, Movie titles, Bechdel results in the early 1990s")
    #Finding all movies from 1990 to 1993 (two decades ago^)
    decade10= bd.loc[(bd["year"]>=1990) & (bd["year"]<=1993)]
    print(decade10[["year","title","binary"]])
    print()
    print()
    
    
    #**********SORTING (ASCENDING/DESCENDING QUERIES)**************
    #Finding 5 movies that gained highest international gross
    print("Movies with 5 Highest International Gross 2013 with title, bechdel binary, International 2013 gross amount") 
    highest_int13_gross = bd.sort_values("intgross_2013$",ascending=False)
    print(highest_int13_gross[["title", "binary","intgross_2013$" ]].head(5))
    print()
    
    
    
    #Finding 5 movies that gained highest domestic gross (interpret influence later US v. Global)
    print("Movies with 5 Highest Domestic Gross 2013 with title, bechdel binary, International 2013 gross amount") 
    highest_dom13_gross = bd.sort_values("domgross_2013$",ascending=False)
    print(highest_dom13_gross[["title", "binary","domgross_2013$" ]].head(5))
    print()
    print()

    print("Movies with 5 Highest Budgets 2013 with title, bechdel binary, International 2013 gross amount") 
    highest_budget_gross = bd.sort_values("budget_2013$",ascending=False)
    print(highest_budget_gross[["title", "budget_2013$","binary" ]].head(5))
    print()
    print()
    
    print("Top 10 with Highest Grosses in 2013 Movie Titles and Bechdel Result")
    #Find 10 highest grossed movies (compare to bechdel results)
    highest_gross = bd.sort_values("total_gross_2013",ascending=False)
    print(highest_gross[["title", "binary"]].head(10))
    print()
    print()
    
    #**********SUMMARY FUNCTION QUERIES)**************
    #Calculate statistics for 2013 movie budgets (can tell if there is a skew)
    print("2013 Movie Budget Statistics")
    #Minimum
    budget_2013_minimum = bd['budget_2013$'].min()
    print("Minimum:            ", budget_2013_minimum )
    #Maximum
    budget_2013_maximum = bd['budget_2013$'].max()
    print("Maximum:            ", budget_2013_maximum)
    #Median 
    budget_2013_median = bd['budget_2013$'].median()
    print("Median:             ", budget_2013_median)
    #Mean
    budget_2013_mean = bd['budget_2013$'].mean()
    print("Mean:               ", budget_2013_mean)
    #Standard Deviation
    budget_2013_standev = bd['budget_2013$'].std()
    print("Standard Deviation: ", budget_2013_standev)
    print()
    
    
    #Calculate statistics for initial movie budgets (can tell if there is a skew + difference from 2013 statistics)
    print("Initial Movie Budget Statistics")
    #Minimum
    budget_initial_minimum = bd['budget_initial'].min()
    print("Minimum:            ", budget_initial_minimum )
    #Maximum
    budget_initial_maximum = bd['budget_initial'].max()
    print("Maximum:            ", budget_initial_maximum)
    #Median 
    budget_initial_median = bd['budget_initial'].median()
    print("Median:             ", budget_initial_median)
    #Mean
    budget_initial_mean = bd['budget_initial'].mean()
    print("Mean:               ", budget_initial_mean)
    #Standard Deviation
    budget_initial_standev = bd['budget_initial'].std()
    print("Standard Deviation: ", budget_initial_standev)
    print()
    
    
    #**********INFORMATION FOR MISSING DATA**************
    #All my null values are removed from last assignment so pandas shows NaN; so there is no missing data to account for
    print("Total of Null values in each data column" )
    #Finding the sum of all null values in each column
    print(bd.isnull().sum())
    print()
    print()
    #Calculating the rows without significant unknown values (ie. in domestic and inteernational gross columns)
    sufficient_rows = bd.dropna(subset=["domgross_initial", "intgross_initial", "domgross_2013$", "intgross_2013$"], how="all").shape[0]
    
    print(sufficient_rows, "Rows without significant amount of unknown values")
    
Bechdel_Query()