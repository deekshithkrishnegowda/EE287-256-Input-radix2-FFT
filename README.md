The FFT will support complex fixed point signed and unsigned numbers at 300MHz. The design was made to pass 800 plus testcases. 

More details can be found in the spec sheet - ffts18.pdf

The code is written in Verilog. Simulation and synthesis is carried out in Synopsys VCS and NCverilog.


-------------------------------------------------------------------------------
EE287 Project S-18 : 256 point Complex radix - 2 DIT FFT, cycle time = 3.33ns
-------------------------------------------------------------------------------

-------------
Team Members
-------------

1. Pallavi Nagaraju 			:	pallavi.nagaraju@sjsu.edu			:	012067471
2. Deekshith Krishnegowda		:	deekshith.krishnegowda@sjsu.edu			:	012417080

------------------------
Statement of Completion
------------------------
1. The design passed all the test cases in both VCS and NCVerilog
2. The design has been synthesized at 300Mhz with a positive slack of 0.21ns
3. Gate level Simulations worked


-------------------
Design Description
-------------------
The 256 point complex FFT design has 3 stages of buffers (30*256) : input buffer, intermediate buffer and output buffer for real part and imaginary part.

When the 'startin' signal is asserted, the 20 bit 'realin' and 'imagin' are sign extended and stored in the input buffer.
An 8 bit counter is used to do bit reversal. The bit reversed address is then used for re-ordering of incoming burst of inputs.
Re-ordering at input stage is necessary as we are using DIT FFT radix -2 method to compute the FFT. 
 
Once all the 256 data is stored in the input buffer, all 256 data is transfered to the intermediate buffer in one clock cycle. 

Butterfly module is designed which also contains the twiddle factors. Twiddle factor values are 22 bit wide, with binary points 20 bits from right.

A FSM is designed to provide the case select for twiddle selection, read address to fetch input data to butterfly, write address to store the results of butterfly operation.
For the first 7 stages of fft operation, the data is read from intermediate buffer and the results are stored in the same.
At the 8th stage of fft operation, the data is read from intermediate buffer and the results are stored in output buffer.

When the FSM completes last stage of operation it asserts 'startout' signal for a duration of 1 clock pulse.
The 'startout' indicates the first output of the fft module and other 255 outputs are obtained in a sequentail manner after 'startout'. 

4 stage DW02 multiplier is used to pipeline 30*22 bit multiplication. 
2 more stages of pipeline is used in input and output side of the butterfly module to break logic and make the design work at 300Mhz.

---------------
Files included
---------------
1. fixed_multiplication.v
This module takes 2 inputs of width 30 and 22 bits and performs multiplication and provides product of width 30 bits.
The truncation logic to truncated the 52 bit product to 30 bit is included here.

2.  complex_multiplication.v
The fixed_multiplication module is instantiated 4 time in this module to perform one complex multiplication.

 
3.  butterfly.v
This performs one complete butterfly operation (using complex_multiplication). 
This module also contains the logic to select the twiddle factor values required for butterfly operation.

4.  input_int_buffer.v
This file contains input and intermediate buffers for both real and imaginary part.
Handles all the read and write operation to the buffers.

5.  output_buffer.v
This file contains the output buffer handling the output write operation to the buffer and the sequential output of the fft results.
The final stage fft results computed will be 30 bits wide. The MSB 20 bits of these results are selected and given to the output as 'realout' and 'imagout'
 
6.  FSM.v
This module contains the core logic of the design that generates the read address, write address, twiddle case select, read enables and write enables.
FSM has 256 states controlled by a counter, each state performing 4 butterfly operations in parallel.

7.  fft.v
This is the top module of the design. All other modules used are instantiated in this module.

8.  twiddle_factor.py
This is the python code used to generate the twiddle factors.

9.  results.txt

10. synres.txt

11. all files from " morris/287/s18/fft/* "



 


   
