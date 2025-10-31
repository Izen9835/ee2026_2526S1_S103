module pwmGen (
    input clk,
    input [7:0] dutyCycle,
    output reg signal
    );
    initial signal = 0;
    
    reg [7:0] count;
    initial count = 8'd255;
    
    wire _1khz;
    clk_1khz _ (clk, _1khz);
    
    always @ (posedge _1khz) begin
        if (count == 0) 
            count = 8'd255;
        else
            count = count - 1;
        
        if (count <= dutyCycle)
            signal = 1;
        else
            signal = 0;
    end
    
endmodule