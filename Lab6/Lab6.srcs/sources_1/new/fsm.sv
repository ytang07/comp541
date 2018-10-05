//////////////////////////////////////////////////////////////////////////////////
// Montek Singh
// 9/28/2017 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype none

module fsm(
    input wire clk,
    input wire btnu, btnd, btnc,          // List of inputs to FSM
    output logic paused, countup        // List of outputs of FSM
                                          // The outputs must be synthesized as combinational logic!
    );


      // The next line is our state encoding
      // You enumerate states, and the compiler decides state encoding

    //enum { STATE0, STATE1, STATE2, ... etc. } state, next_state;

      // -- OR --   
      // You can specify state encoding

    enum { countingUp=3'b000, pausingUp=3'b001, pausedUp=3'b010, resumingUp=3'b011,
           countingDown = 3'b100, pausingDown = 3'b101, pausedDown = 3'b110, resumingDown = 3'b111} state, next_state;



        // Instantiate the state storage elements (flip-flops)
    always_ff @(posedge clk) begin
      state <= next_state;
    end

        // Define next_state logic => combinational
        // Every case must either be a conditional expression
        //   or an "if" with a matching "else"
    always_comb begin
      case (state)
      
            countingUp: next_state <= (btnd == 1) ? countingDown : (btnc == 1) ? pausingUp : countingUp;
            pausingUp: next_state <= (btnc == 0) ? pausedUp : pausingUp;
            pausedUp: next_state <= (btnc == 1) ? resumingUp : (btnd == 1) ? pausedDown : pausedUp;
            resumingUp: next_state <= (btnc == 0) ? countingUp : resumingUp;
            
            countingDown: next_state <= (btnu == 1) ? countingUp : (btnc == 1) ? pausingDown : countingDown;
            pausingDown: next_state <= (btnc == 0) ? pausedDown : pausingDown;
            pausedDown: next_state <= (btnc == 1) ? resumingDown : (btnu == 1) ? pausedUp : pausedDown;
            resumingDown: next_state <= (btnc == 0) ? countingDown : resumingDown;
            
            default: next_state <= state;
            
      endcase
    end


        // Define output logic => combinational
        // Every case must either be a conditional expression
        //   or an "if" with a matching "else"
    always_comb begin    
      case (state)
            countingUp: {paused, countup} = {1'b0,1'b1};
            pausingUp: {paused, countup} = {1'b0,1'b1};
            pausedUp: {paused, countup} = {1'b1,1'b1};
            resumingUp: {paused, countup} = {1'b1,1'b1};
            
            countingDown: {paused, countup} = {1'b0,1'b0};
            pausingDown: {paused, countup} = {1'b0,1'b0};
            pausedDown: {paused, countup} = {1'b1,1'b0};
            resumingDown: {paused, countup} = {1'b1,1'b0};
            
            default: {paused, countup} = {1'b0, 1'b1};
      endcase
    end
endmodule