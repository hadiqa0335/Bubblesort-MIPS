## Programming Assignment

#### Information

This assignment is worth 10% of the total module mark. The submission deadline is **23.59** on **Wednesday 8 November 2017**. Submissions should be made via the assignment page on Canvas. Late submissions will not be accepted unless approved by the School of Computer Science Welfare Team ([welfare@cs.bham.ac.uk](mailto:welfare@cs.bham.ac.uk)).

#### Description

The bubblesort algorithm is a simple method for sorting a list. It is not a particularly efficient method, but it is at a suitable level of complexity for this exercise, in which you will write a MIPS assembly language to read in a list of signed integers, sort themin ascending order, and print them. The program will have the following features:

- The program will prompt for, and then read in an integer that specifies the number of items that will be entered for sorting.
- The program will then prompt for, and read in the specified number of integers, which will be **stored on the heap**.
- The program will call a subroutine called **bubblesort** that implements the bubblesort algorithm and sorts the list in place (i.e. it should not create copies of the list)
- The program will print the sorted list and then terminate.

Credit (ten marks) will be awarded as follows:

- One mark for a program that runs (even if incorrect)
- One mark for reading the inputs
- Two marks for correct use of the heap
- Five marks for correct implementation of the bubblesort algorithm as a subroutine
- One mark for printing the sorted list

Your submission should consist of a single file called **bub.s.** Incorrectly named submissions will not be marked. Submissions will be evaluated using the QtSpim simulator installed on the school's lab machines (under windows in LG04), and by visual inspection to verify the program structure.

### Rubric

This criterion is linked to a learning outcomeProgramme runs
1.0 pts  

This criterion is linked to a learning outcomeReads inputs correctly
1.0 pts  

This criterion is linked to a learning outcomeCorrect use of the heap
2.0 pts  

This criterion is linked to a learning outcomeCorrect implementation of bubblesort
5.0 pts  

This criterion is linked to a learning outcomePrints results correctly
1.0 pts  

Total points: 10.0