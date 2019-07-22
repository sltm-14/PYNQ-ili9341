
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
{LOW, LOW,  ",ItH(VH),"},\n"]
    f.writelines(write_comm)


def Lcd_Write_Data(VH):
    write_comm = ["\
{LOW, HIGH, ",ItH(VH),"},\n"]
    f.writelines(write_comm)


def LCD_Clear(j):
    address_set(0,0,240,320)
    for x in range(0,240):
        for x in range(0,320):
            Lcd_Write_Data(j>>8)
            Lcd_Write_Data(j)


f = open("text.txt", "w+")
LCD_Clear(46083)
f.close()
