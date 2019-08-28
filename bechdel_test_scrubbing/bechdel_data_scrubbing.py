'''
Data Scrubbing


 Actors Data Cleanup 
1. *Change header titles for budget, domgross and ingross to budget_initial, domgross_intial and ingross_initial
2. *If there is a dash ("-"), remove the string except the clarifying description after the dash; Change header title "test" to "clarifier", i
    else replace descriptions in other rows with "none" because this data is qualitative
3. *Remove code column because it is just the combination of year and binary column 
4. *Compute and create column for the total gross income adding international and domestic gross income (for both initial and 2013)
5. Remove decade code column
6. *Change html entities into readable characters
7. *Remove all unknown values (N/A) from all rows
8. Create an option to include a header or not for the user
9. Create a .csv file


Programming steps:
1. Open dource file (bechdel data) to read (excpetion-handling statement)
2. Create a prompt in loop for the user to ask for a header.
3. Open csv file in write mode 
4. Create boolean for whether the user wants a header or not 
5. For loop: read each line from data file 
6.Split the lines (+header, depending on user) data_file into a list (at the commas since the data file was a csv) store in data variable
7. Concatenate list indexes(columns) that are relevant
8. Append two columns with holding values "total_gross_initial", "total_gross_2013" (stored in a list) **will be overwritten later
9. Reassign the titles of thee columns being altered 
10. Check if "-" character is in index 3 of data, find its index, reassign index position to the range from "-" index to the end (cut the data)
11. Creeate new condition where if the clarifier row ^ is the same as the test row, reassign clarifier to "none"   
12. Find position where there is html entities, string replace them with the actual characters, assign to index position
13. Remove "N/A" or unknown values to allow better calculations in for loop iterating through the length of the data list and checking every position
14. For both gross(intial) and gross(2013), check id values are numeric, if they are convert values to integers add the international and domestic gross, 
    assign the sum to corresponding appended column (*make sure to leave out title row by checking if gross columns are not the titles, domgross_2013$, intgross_2013$, intgross_initial, domgross_initial  )
15. Create condition for unknown gross value rows that assigns no values to corresponding computing column 
16. Join data list with "," and write each line with a break to clean_file
17. Close read and write files.  

       
 '''

import csv


#def Bechdel_Data_Cleanup():
source_file = 'bechdel_test.csv'
   

user_request = input("Would you like to see the header (Y/N) ")

while user_request.upper() != 'Y' and user_request.upper() != 'N':
    user_request = input("Invalid input. Would you like to see the header (Y/N) ") 



try:
    data_file = open(source_file,'r')
except FileNotFoundError:
    print("File Not Found.")
else:
    print("File found. ")
    reader = csv.reader(data_file,delimiter=',',skipinitialspace=True)
    clean_file_name = "bechdel_data.csv"
    clean_file = open(clean_file_name,'w')
   
    writer = csv.writer(clean_file,delimiter=",")
    
    
    if user_request.upper() == 'Y':
        printheader = True
        
    elif user_request.upper() == 'N':
        printheader = False

    
    for data in reader:   
        #Adding/Removing header
        if (not printheader and data[0]=="year"):
            continue
        if (printheader and data[0]=="year") :
             #Change title names
            if data[3] == "test":
                data[3] = "classifier"
                               
            if data[6] == "budget":
                data[6] = "budget_initial"
               
                
            if data[7] == "domgross":
                data[7] = "domgross_initial"
                
            if data[8] == "intgross":
                data[8] = "intgross_initial"  
            
        #Removing columns 
        data = data[0:9] + data[10:-1]
        
        #Appeending two columns
        new_columns = ["total_gross_initial", "total_gross_2013"]       
     
        
        data = data + new_columns
        
        #Cutting data   
        if "-" in data[3]:
            dash_index = data[3].find("-")
            data[3] = data[3][dash_index+1:-1]
        if data[3] == data[4]:
            data[3] = "none"
        
        
        #Fixing a a recurring typo
        if "disagre" in data[3]:
            data[3]= data[3].replace("disagre", "disagree")   
            
            
       #Replacing unclear data
        if "&amp;" in data[2]:
            data[2]= data[2].replace("&amp;", "&")
            
        if "&#39;" in data[2]:
            data[2]= data[2].replace("&#39;", "'")
        #Removing unknown data from numerial column 
        for d in range(len(data)):
            if data[d]=="N/A":
                data[d] = ""
        
                
        #Computing columns
        
        if data[7].isnumeric() and data[8].isnumeric():
            dom_initial_amount = int(data[7])
            int_initial_amount = int(data[8])
            total_initial_amount = dom_initial_amount + int_initial_amount
            data[-2] = str(total_initial_amount)
        elif ((not data[7].isnumeric()) or (data[8].isnumeric())) and (data[7]!="domgross_initial" and data[8]!="intgross_initial"):
            data[-2]=""
        
  
        
        if data[10].isnumeric() and data[11].isnumeric():
            dom_2013_amount = int(data[10])
            int_2013_amount = int(data[11])
            total_2013_amount = dom_2013_amount + int_2013_amount
            data[-1] = str(total_2013_amount)
           
        elif ((not data[10].isnumeric()) or (data[11].isnumeric())) and (data[10]!="domgross_2013$" and data[11]!="intgross_2013$"):
            data[-1]=""
        
        
        
        
        writer.writerow(data)
           
    
        
    # Close the files        
    data_file.close()
    clean_file.close()
    
       
        

#Bechdel_Data_Cleanup()