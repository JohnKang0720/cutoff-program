# UBC International Computer Science CUTOFF Program

<h3>Purpose</h3>

This cutoff program is intended to provide myself/others on future cutoffs as it will give them a better understanding of the increasing competition every year.
The program is made using R with an implementation of simple, linear regression. 


<h3>Process</h3>

There were also a few optimizations to make the prediction result more accurate: 
- Removing outliers 
- Finding paramters that would decrease the std. error.
- Rounding the grade averages to decrease the residual errors.

Through this program, it was able to approximate the cutoff for the CS program this year. The visualization incorporated in this program suggests that the overall averages of students will definitely increase over time.
However, there were a couple of data/technical -related problems. The first is that the source of data that was used to create this program may be inaccurate since it was created by a student from UBC. 
Second, there is a lack of data which would underfit the linear regression plot which caused the residual error as well as the residuals plot to be not 100% accurate.

<h3>Results</h3>

![lr](https://github.com/JohnKang0720/cutoff-program/assets/76849492/470346f6-f230-4dd4-9083-82527b9c9faa)

![plot](https://github.com/JohnKang0720/cutoff-program/assets/76849492/0764c9d8-9ff0-4a37-a875-fa8adf3d1ac1)

![result](https://github.com/JohnKang0720/cutoff-program/assets/76849492/3763fc41-95e1-44f8-b8fd-ab968d8c65eb)
