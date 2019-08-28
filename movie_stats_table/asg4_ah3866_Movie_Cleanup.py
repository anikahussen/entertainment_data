#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar  5 05:22:51 2019

@author: anikahussen
"""

import csv 

def Movies_Data_Cleanup():
    source_file = "asg4_ah3866_original_movie_metadata.csv"

    user_request = input("Would you like to see the header (Y/N) ")

    while user_request.upper() != 'Y' and user_request.upper() != 'N':
        user_request = input("Invalid input. Would you like to see the header (Y/N) ") 

    
    try:
        data_file = open(source_file, 'r')
    except FileNotFoundError:
        print("File not found.")
        
    else:
        print("File found.")
        reader = csv.reader(data_file, delimiter=",", skipinitialspace=True)
        clean_file_name = "asg4_ah3866_clean_movie_data.csv"
        clean_file = open(clean_file_name, 'w')

 
        
        writer = csv.writer(clean_file, delimiter=",")
        
        for data in reader:
            if (data[0]=="color"):
                continue

            data = data[1:5] + data[7:14] + data[18:24] + data[25:]
        
        
         
            
            writer.writerow(data)
        
        
        data_file.close()
        clean_file.close()
        
Movies_Data_Cleanup()
