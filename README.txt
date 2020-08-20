#Efficent integrated round_robin arbiter

-Today rapid evolution in technology, the complexity becomes one of the most constraining aspects in the design of embedded systems. Cost and timing issues come along to add to the difficulties in realization of SOC, applications,where many IPs such as processor cores, memories, DSP processors and peripheral devices are placed together, on a single Core.

-It is useful to have some resource shared by a number of different devices. Usually, the resource can be used by only one device at a time. When various devices need to use the resource, they have to request to do so. These requests are handled by an Arbiter

-To Avoid conflict between different device request and fair priortization implemented Round Robin scheduling alogorithim with Arbiter

Here i implemented 4 reguest & 4 grant Arbiter with Round Robin
This arbiters can be used for any purposes.

-The execution time delay complexity of our arbiter is approximately O(log4 n), and the area complexity of our arbiter is O(n) of 2-input logic gates

Proof: The state value (unsigned binary value) of every state in Fig. 2 uses one-hot coding,
and each next state’s value depends just on its outputs gi’s and only one of gi’s will
be 1 (granted), assume gi = 1, which only makes t(i+1) mod n to be 1, and other ti’s still 0.
Therefore, state coding still in one-hot coding. For example, when at state 0100 and
r0r1r2r3 = 0010, then its output g2 is set to 1 and its next state t0t1t2t3 is 0001. This shows
that the only using authority has been rotated fairly from user request r1(t1) to user request
r3(t3), which meets the functional definition of our new


Please contact if you have any query or suggestion: vikas7268@hotmail.com

Reference: 

	[1] E. S. Shin, V. J. Mooney, and G. F. Riley, “Round-robin arbiter design and generation,”
            in Proceedings of the 15th International Symposium on System Synthesis,2002, pp. 243-248.
        
	[2] Jer-Min Jou And Yun-Lung Lee,"An Optimal Round-Robin Arbiter Design for NoC"Journal Of Information Science and Engineering 26,2047-2058 (2010)
