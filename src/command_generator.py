
def ItH(int_val):
    hex_val = hex(int_val).lstrip("0x")

    if int_val == 0:
        val = "8'h00"
    elif int_val <16 :
        val = "8'h0" + str(hex_val)
    else:
        val = "8'h" + str(hex_val)

    return val

def address_set(x1, y1,x2,y2):
    add_set = ["\
    {LOW, LOW,  8'h2A},\n\
    {LOW, HIGH, ",ItH(x1 >> 8),"}, {LOW, HIGH, ",ItH(x1),"}, {LOW, HIGH, ",ItH(x2 >> 8),"}, {LOW, HIGH, ",ItH(x2),"},\n\
    {LOW, LOW,  8'h2B},\n\
    {LOW, HIGH, ",ItH(y1 >> 8),"}, {LOW, HIGH, ",ItH(y1),"}, {LOW, HIGH, ",ItH(y2 >> 8),"}, {LOW, HIGH, ",ItH(y2),"},\n\
    {LOW, LOW,  8'h2C},\n\n"]
    f.writelines(add_set)


def Lcd_Write_Com(VH):
    write_comm = ["\
    {LOW, LOW,  ",ItH(VH),"},  "]
    f.writelines(write_comm)


def Lcd_Write_Data(VH):
    write_comm = ["\
    {LOW, HIGH, ",ItH(VH),"},  "]
    f.writelines(write_comm)


def LCD_Clear(j):
    address_set(0,0,240,320)
    for x in range(0,240):
        for x in range(0,320):
            Lcd_Write_Data(j>>8)
            Lcd_Write_Data(j-((j>>8)<<8))
            if ( x % 10 ) == 0:
                f.writelines("\n")


f = open("pkg_loop.sv", "w+")
f.write("`ifndef pkg_loop\n")
f.write("`define pkg_loop\n")
f.write("\n")
f.write("package pkg_loop;\n")
f.write("\n")
f.write("  /*-------------------------------------------------------------------- PARAMETERS ----------------------------------------------------------------------*/\n")
f.write("\n")
f.write("  localparam COMM_LOOP = 11;\n")
f.write("\n")
f.write("  localparam HIGH      = 1'b1;\n")
f.write("  localparam LOW       = 1'b0;\n")
f.write("\n")
f.write("  /*----------------------------------------------------------------- LOOP COMMANDS ARRAY -----------------------------------------------------------------*/\n")
f.write("\n")
f.write("  logic [9:0] loop_commands [COMM_LOOP-1:0] = {\n")

LCD_Clear(0x3025)
Lcd_Write_Data(0)

f.write("\n")
f.write("  };\n")
f.write("\n")
f.write("endpackage\n")
f.write("`endif\n")
f.close()
