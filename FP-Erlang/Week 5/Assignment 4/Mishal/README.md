# ASSIGNMENT-4

### NOTE
- To check the timings of each program, following has been used while compiling(the output will be of the form ```{time,output}``` where time is in microseconds(μs)):-
```
timer:tc(file_name, function_name, input).
```
- To generate random lists of varying sizes where numbers are in range 1-100, following has been used:-
```
[rand:uniform(100) || _ <- lists:seq(1,size)].
```
- Answer to ```How many elements does it take for the sum of the square roots of all natural numbers to
exceed 1000?``` came ```130```

### Timer for Quick Sort

<table>
  <thead>
    <tr>
      <td>Value of N</td>
      <td>Time in μs</td>
    </tr>
  </thead>
    <tr>
      <td>10</td>
      <td>32</td>
    </tr>
    <tr>
      <td>10<sup>2</sup></td>
      <td>657</td>
    </tr>
    <tr>
      <td>10<sup>3</sup></td>
      <td>8377</td>
     </tr>
     <tr>
      <td>10<sup>4</sup></td>
      <td>643021</td>
     </tr>
     <tr>
      <td>10<sup>5</sup></td>
      <td>2.2 <b>min</b></td>
     </tr>
