# UBC International Computer Science CUTOFF Program

This cutoff program is intended to provide myself/others on future cutoffs as it will give them a better understanding of the increasing competition every year.
The program is made using R with an implementation of simple, linear regression. 

There were also a few optimizations to make the prediction result more accurate: 
- Removing outliers 
- Finding paramters that would decrease the std. error.
- Rounding the grade averages to decrease the residual errors.

Through this program, it was able to approximate the cutoff for the CS program this year. The visualization incorporated in this program suggests that the overall averages of students will definitely increase over time.
However, there were a couple of data/technical -related problems. The first is that the source of data that was used to create this program may be inaccurate since it was created by a student from UBC. 
Second, there is a lack of data which would underfit the linear regression plot which caused the residual error as well as the residuals plot to be not 100% accurate.
