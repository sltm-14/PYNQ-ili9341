address = "{LOW, LOW,  8'h2A},\n{LOW, HIGH, x1 >> 8},{LOW, HIGH, x1},{LOW, HIGH, x2 >> 8},{LOW, HIGH, x2},\n{LOW, LOW,  8'h2B},\n"
address = address + "{LOW, HIGH, y1 >> 8},{LOW, HIGH, y1},{LOW, HIGH, y2 >> 8},{LOW, HIGH, y2},\n{LOW, LOW,  8'h2C},\n\n{LOW, LOW,  8'hFF}\n "


# def lcd_write_data(data):
#
# def lcd_write_comm(comm):

def address_set(x1, y1,x2,y2):
    print(" {LOW, LOW,  8'h2A},\n{LOW, HIGH, ",x1 >> 8,"},{LOW, HIGH, x1},{LOW, HIGH, x2 >> 8},{LOW, HIGH, x2},\n{LOW, LOW,  8'h2B},\n ")

address_set(1250,5,7,9)



# void Address_set(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2){
#   Lcd_Write_Com(0x2a);
#
#   Lcd_Write_Data(x1>>8);
#   Lcd_Write_Data(x1);
#   Lcd_Write_Data(x2>>8);
#   Lcd_Write_Data(x2);
#
#   Lcd_Write_Com(0x2b);
#
#   Lcd_Write_Data(y1>>8);
#   Lcd_Write_Data(y1);
#   Lcd_Write_Data(y2>>8);
#   Lcd_Write_Data(y2);
#   Lcd_Write_Com(0x2c);
# }
#
# void Lcd_Write_Com(unsigned char VH){
#   *(portOutputRegister(digitalPinToPort(RS))) &=  ~digitalPinToBitMask(RS);//LCD_RS=0;
#   Lcd_Writ_Bus(VH);
# }
#
# void Lcd_Write_Data(unsigned char VH){
#   *(portOutputRegister(digitalPinToPort(RS)))|=  digitalPinToBitMask(RS);//LCD_RS=1;
#   Lcd_Writ_Bus(VH);
# }
#
# void LCD_Clear(unsigned int j){
#   unsigned int i,m;
#   digitalWrite(CS,LOW);
#   Address_set(0,0,240,320);
#   for(i=0;i<240;i++)
#     for(m=0;m<320;m++)
#     {
#       Lcd_Write_Data(j>>8);
#       Lcd_Write_Data(j);
#     }
#   digitalWrite(CS,HIGH);
# }
