// This is a very simple top level driver for the fft simulation
// it is designed for 300 MHz. for simulation ease, the cycle time is 10ns (100Mhz)
//
`timescale 1ns/10ps
// A place for design ware goes here
//`include "DW02_mult_3_stage.v"

`include "fft.v"
`include "/apps/synopsys/I-2013.12-SP5/dw/dw02/src_ver/DW02_mult_4_stage.v"

module top();

reg clk,reset;

reg [19:0] realin,imagin,realout,imagout;
reg startin,startout;
int fh;
reg [7:0] icnt;
string strin;
reg [19:0] expreal[0:1023],expimag[0:1023],reale,image;
reg expstart[0:1023];
reg [9:0] hp,tp;
int ecnt;
int death;
reg [19:0] realout0,imagout0;
reg startout0;
int inblk;

function reg faildelta(input reg signed [19:0] got,
    input reg signed [19:0] exp);
    reg signed [19:0] diff;
    if (^got === 1'bx) return 1;
    diff = got-exp;
    if(diff < 0) diff = -diff;
    if(diff > 3) return 1;
    return 0;
endfunction : faildelta

always @(posedge(clk)) begin
    if(hp != tp && expstart[tp]==1 && startout==1) begin
        inblk=1;
        realout0=realout;
        imagout0=imagout;
        startout0=startout;
        #0.01; // check for hold time
        if (realout0 !== realout) begin
            $display("Error, No hold time on realout");
            #10 $finish;
        end
        if (imagout0 !== imagout) begin
            $display("Error, No hold time on imagout");
            #10 $finish;
        end
        if (startout0 !==startout) begin
            $display("Error, No hold time on startout");
            #10 $finish;
        end
        if(faildelta(realout0,expreal[tp])) begin
            $display("Error, real out incorrect. Exp %h, got %h",expreal[tp],realout0);
            #10 $finish;
        end
        if(faildelta(imagout0,expimag[tp])) begin
            $display("Error, imag out incorrect. Exp %h, got %h",expimag[tp],imagout0);
            #10 $finish;
        end
        if(startout0 !== expstart[tp]) begin
            $display("Error, start out incorrect. Exp %h, got %h",expstart[tp],startout0);
            #10 $finish;
        end
        tp=tp+1;
        death=2000;
    end else if(inblk != 0) begin
        realout0=realout;
        imagout0=imagout;
        startout0=startout;
        #0.01; // check for hold time
        if (realout0 !== realout) begin
            $display("Error, No hold time on realout");
            #10 $finish;
        end
        if (imagout0 !== imagout) begin
            $display("Error, No hold time on imagout");
            #10 $finish;
        end
        if (startout0 !==startout) begin
            $display("Error, No hold time on startout");
            #10 $finish;
        end
        if(faildelta(realout0,expreal[tp])) begin
            $display("Error, real out incorrect. Exp %h, got %h",expreal[tp],realout0);
            #10 $finish;
        end
        if(faildelta(imagout0,expimag[tp])) begin
            $display("Error, imag out incorrect. Exp %h, got %h",expimag[tp],imagout0);
            #10 $finish;
        end
        if(startout0 !== expstart[tp]) begin
            $display("Error, start out incorrect. Exp %h, got %h",expstart[tp],startout0);
            #10 $finish;
        end
        tp=tp+1;
        inblk=inblk + 1;
        if(inblk >= 256) begin
            inblk=0;
        end
        death=2000;

    end else begin
        if(startout===1'bx) begin
            $display("Error, startout is 'X'");
            #10 $finish;
        end
        if( ^realout===1'bx || ^imagout===1'bx) begin
            $display("Error, realout or imagout has an 'X'");
            #10 $finish;
        end
    end
    death=death-1;
    if (death < 0) begin
        $display("Error, Waited 2000 clocks for data out, giving up");
        $finish;
    end

end



initial begin
    clk=0;
    startin=0;
    reset=1;
    icnt=0;
    hp=0;
    tp=0;
    ecnt=0;
    death=2000;
    inblk=0;
    repeat(400000) begin
        #5 clk=0;
        #5 clk=1;
    end
    $display("Ran out of clocks");
    $finish;
end

initial begin
    repeat(3) @(posedge(clk)) #1;
    reset=0;
end

int bob;
initial begin
    repeat(10) @(posedge(clk)) #1;
    fh = $fopen("fft_cases.txt","r");
    while( $fgets(strin,fh) ) begin
        case(strin[0])
            "i": begin
                ecnt=0;
                bob=$sscanf(strin,"%*s %h %h",realin,imagin);
                if (icnt==0) begin
                    startin=1;
                end else begin
                    startin=0;
                end
                icnt += 1;
                @(posedge(clk)) #1;
            end
            "e": begin
                icnt=0;
                bob=$sscanf(strin,"%*s %d %d",reale,image);
                expreal[hp]=reale;
                expimag[hp]=image;
                expstart[hp]=ecnt==0;
                ecnt += 1;
                hp += 1;
                if (hp == tp) begin
                    $display("Morris, you overran the expected fifo...");
                    $finish;
                end
            end
            "#": begin
            end
            "d": begin
                @(posedge(clk)) #1;
            end
            "q": begin
                repeat(2000) @(posedge(clk));
                $display("\n\n\nI'm all done now\nYou did good!\n\n\n");
                $finish;
            end
            default : begin
                $display("Unexpected input file line\n%s",strin);
            end
        endcase
    
    end
    
    
    
    $fclose(fh);


end


/*initial begin
    $dumpfile("fft.vpd");
    $dumpvars(0,top);
end*/



fft f(clk,reset,realin,imagin,startin,
    realout,imagout,startout);







endmodule : top
