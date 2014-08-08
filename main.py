__author__ = 'shaycraft'
from LegalExploder import *
import argparse
import csv
import os
import sys

# getcommand line argument
parser = argparse.ArgumentParser(description='Red crown legal exploder.')
parser.add_argument('inputfile', metavar='Input CSV File', type=str, help='Input csv file')
parser.add_argument('outputfile', metavar='Output CSV File', type=str, help='Output csv file')
args = parser.parse_args()

in_csv = args.inputfile
out_csv = args.outputfile

idx = 0  # set to 0, as we need to skip header row
if os.path.isfile(out_csv):
    #print "Warning!  Overwrite {0} (Y/N)?".format(out_csv)
    choice = raw_input("Warning!  Overwrite {0} (Y/N)?".format(out_csv))
    if choice.upper() != 'Y':
        sys.exit()

fs = open(out_csv, 'w')
writer = csv.writer(fs, lineterminator='\n')
#print header
fs.write('lease_id, state, county, township, tdir, range, rdir, section, qq, lessee, gross, net, leasenumber, '
         'leasedate, wellname\n')

with open(in_csv, 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    for row in reader:
        legal = explode(row[7])
        for item in legal:
            curr_line = [idx, row[0], row[1], row[2], row[3], row[4], row[5], row[6], item, row[8], row[9], row[10],
                         row[11], row[12], row[13]]
            writer.writerow(curr_line)
        idx += 1
fs.close()