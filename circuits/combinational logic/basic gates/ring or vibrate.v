module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always @(*) begin
        ringer=ring&&(~vibrate_mode);
        motor=ring&&vibrate_mode;
    end
endmodule