log_file = open("um-server-01.txt")


def generate_sales_reports(log_file):
    for line in log_file:
        line = line.rstrip()
        day = line[0:3]
        if day == "Mon":
            print(line)

# set log file to openning a text file 
# creates a function that generates the sales reports 
# for each line in the log_file do this
# set line to line without spaces 
# set day to the first three characters of line 
# if the first 3 characters is mon
# then print the line 
# call the function passing in the log  file 


generate_sales_reports(log_file)
