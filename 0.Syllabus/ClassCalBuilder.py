from datetime import date, timedelta
import sys
from sets import Set

class MakeSyllabusTable:

    def __init__(self, excludedDatesFileName, classInfo=None):

        self.year=2019
        self.homework=False
        self.classStartDate=(1,14) #month/year
        self.classEndDate=(5,8)
        self.SevenDay=[True,False,True,False,True, False, False] #M-Sunday meet true or false
        self.excludedDates=self.loadExcludedDates(excludedDatesFileName)
        #self.info=info

        self.classDates=self.getClassDays()

        if classInfo != None:
            self.info=self.loadInfo(classInfo)
        print "Number of Class Dates: ", len(self.classDates)

    def getClassDays(self):
        d = date(self.year, self.classStartDate[0], self.classStartDate[1]) # January 1st

        classDates=[]
        while ((d.month != self.classEndDate[0]) or ( d.day !=self.classEndDate[1]+1)):
            if ((self.SevenDay[d.weekday()]) and (d not in self.excludedDates)):
                classDates.append(d)
            d+=timedelta(days=1)

        return(classDates)


    def loadExcludedDates(self,fp):
        """Load the excluded dates for the semester"""

        f=open(fp,'r').readlines()
        process=lambda x: map(int, x.strip().split('/'))
        dates1=map(process, f)
        dates=Set([date(dates1[i][2], dates1[i][0], dates1[i][1]) for i in range(0, len(dates1))])
        return(dates)

    def loadInfo(self, fp):
        """Load the info to be included in the semester"""
        f=open(fp,'r').readlines()
        fs=[f[i].strip().split(',') for i in range(0, len(f))]
        fs2=[]
        for classInfo in fs:
            if (len(classInfo[0])>0):
                if (self.homework):
                    fs2.append([classInfo[0], classInfo[1], ",".join(classInfo[2:])])
                else:
                    fs2.append([classInfo[0], classInfo[1]])
                    
        return(fs2)

    def printLatexTable(self):
        """Make a nice Latex table for the class schedule"""

        if (len(self.classDates) != len(self.info)):
            print "Error: Number of Topics =", len(self.info), " but number of classes is ", len(self.classDates)
            sys.exit(0)
        else:
            for i in range(0, len(self.classDates)):
                line=self.getLine(self.classDates[i], self.info[i])
                print line

    def getLine(self, classDate, info):
        sep=" & "
        line=str(classDate.month)+'/'+str(classDate.day)+sep+sep.join(info)+ " \\\ \hline"
        return(line)
        
        
        
        




if __name__=='__main__':

    a=MakeSyllabusTable('excludedDates2018Spring.txt', 'LinearAlg.txt')
    a.printLatexTable()
