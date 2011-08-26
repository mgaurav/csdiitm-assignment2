module stimulus;
   reg [15:0] A, B;
   reg 	     as;
   
   wire [15:0] sum;
   wire       cout;
   
   adder16 ADDER_16(sum, cout, A, B, as);
   
   initial
     begin
	$monitor($time, "A = %b, B = %b, as = %b, ---> cout = %b, sum = %b %d\n", A, B, as, cout, sum, sum);
     end

   initial
     begin
	A = 16'd0;
	B = 16'd0;
	as = 0;
	
	#5 A = 16'd16;
	B = 16'd3;

	#5 A = 16'd32768;
	B = 16'd32768;
	as = 1;
	
	#5 A = 16'd33000;
	B = 16'd18000;

	#5 A = 16'd60000;
	B = 16'd33000;
     end // initial begin

endmodule // stimulus