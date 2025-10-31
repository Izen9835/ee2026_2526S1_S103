`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2025 19:37:42
// Design Name: 
// Module Name: Binary_Converter_Output
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Binary_Converter_Output(
    input [5:0] randomNum,
    input [12:0] pixel_index,
    output [15:0] oled_data_output
    );
    
reg [15:0] oled_data;

wire [3:0] first_digit = randomNum / 10;
wire [3:0] second_digit = randomNum % 10;
    
wire [6:0] X = pixel_index % 96;  // 0-95
wire [5:0] Y = pixel_index / 96;  // 0-63

always @* begin
if (pixel_index == 714 || pixel_index == 723 || pixel_index == 733 || pixel_index == 923 || pixel_index == 1007 || pixel_index == 1017 || pixel_index == 1019 || pixel_index == 1081 || pixel_index == 1090 || pixel_index == 1140 || pixel_index == 1169 || pixel_index == 1194 || pixel_index == 1211 || pixel_index == 1224 || pixel_index == 1257 || pixel_index == 1282 || pixel_index == 1296 || pixel_index == 1342 || pixel_index == 1379 || pixel_index == 1473 || pixel_index == 1541 || pixel_index == 1575 || pixel_index == 1582 || pixel_index == 1620 || pixel_index == 1629 || pixel_index == 1678 || pixel_index == 1723 || pixel_index == 1745 || pixel_index == 1761 || pixel_index == 1767 || pixel_index == 1776 || pixel_index == 1799 || pixel_index == 1812 || pixel_index == 1815 || pixel_index == 1820 || ((pixel_index >= 1840) && (pixel_index <= 1841)) || pixel_index == 1850 || pixel_index == 1861 || pixel_index == 1883 || pixel_index == 1925 || pixel_index == 1927 || pixel_index == 1934 || pixel_index == 1950 || pixel_index == 1976 || pixel_index == 1982 || pixel_index == 1990 || pixel_index == 1994 || ((pixel_index >= 1999) && (pixel_index <= 2000)) || pixel_index == 2002 || pixel_index == 2005 || pixel_index == 2294) oled_data = 16'b0000100001000001;
else if (pixel_index == 905 || pixel_index == 1022 || pixel_index == 1191 || pixel_index == 1231 || pixel_index == 1258 || pixel_index == 1273 || pixel_index == 1361 || pixel_index == 1463 || pixel_index == 1556 || pixel_index == 1580 || pixel_index == 1652 || pixel_index == 1748) oled_data = 16'b0011100111000111;
else if (pixel_index == 906 || pixel_index == 924 || pixel_index == 1234 || pixel_index == 1242 || pixel_index == 1264 || pixel_index == 1340 || pixel_index == 1414 || pixel_index == 1457 || pixel_index == 1470 || pixel_index == 1568 || pixel_index == 1881) oled_data = 16'b0111001110001110;
else if (pixel_index == 907 || pixel_index == 1336 || pixel_index == 1370 || pixel_index == 1418 || pixel_index == 1469 || pixel_index == 1513 || pixel_index == 1595 || pixel_index == 1863) oled_data = 16'b0110101101001101;
else if (pixel_index == 908 || pixel_index == 1095 || pixel_index == 1163 || pixel_index == 1198 || pixel_index == 1251 || pixel_index == 1449 || pixel_index == 1516 || pixel_index == 1672 || pixel_index == 1676 || pixel_index == 1774 || pixel_index == 2197) oled_data = 16'b0010100101000101;
else if (pixel_index == 914 || pixel_index == 917 || pixel_index == 1118 || pixel_index == 1373 || pixel_index == 1445 || pixel_index == 1452 || pixel_index == 1485 || pixel_index == 1559 || pixel_index == 1612 || pixel_index == 1640 || pixel_index == 1645 || pixel_index == 1655 || pixel_index == 1664 || pixel_index == 1687 || pixel_index == 1751 || pixel_index == 1754 || pixel_index == 1833 || pixel_index == 1847 || pixel_index == 1926 || pixel_index == 1933 || ((pixel_index >= 1938) && (pixel_index <= 1939)) || ((pixel_index >= 1944) && (pixel_index <= 1945)) || pixel_index == 1949 || ((pixel_index >= 1959) && (pixel_index <= 1965)) || ((pixel_index >= 1971) && (pixel_index <= 1972)) || pixel_index == 1975 || ((pixel_index >= 1980) && (pixel_index <= 1981)) || ((pixel_index >= 1983) && (pixel_index <= 1984)) || pixel_index == 1989 || pixel_index == 1995 || ((pixel_index >= 1997) && (pixel_index <= 1998)) || pixel_index == 2001) oled_data = 16'b0001000010000010;
else if (((pixel_index >= 915) && (pixel_index <= 916)) || pixel_index == 1351 || pixel_index == 1430 || pixel_index == 1553 || pixel_index == 1563 || pixel_index == 1644 || pixel_index == 1786 || pixel_index == 1877) oled_data = 16'b0111101111001111;
else if (pixel_index == 925 || pixel_index == 1206 || pixel_index == 1220 || pixel_index == 1358 || pixel_index == 1551 || pixel_index == 1637 || pixel_index == 1759 || pixel_index == 1839) oled_data = 16'b1000010000010000;
else if (pixel_index == 926 || pixel_index == 1010 || pixel_index == 1106 || pixel_index == 1176 || pixel_index == 1221 || pixel_index == 1240 || pixel_index == 1294 || pixel_index == 1298 || pixel_index == 1318 || pixel_index == 1333 || pixel_index == 1394 || pixel_index == 1436 || pixel_index == 1442 || pixel_index == 1490 || pixel_index == 1586 || pixel_index == 1601 || pixel_index == 1638 || pixel_index == 1659 || pixel_index == 1682 || pixel_index == 1697 || pixel_index == 1707 || pixel_index == 1778 || pixel_index == 1793 || pixel_index == 1874 || pixel_index == 1889 || pixel_index == 1896) oled_data = 16'b0001100011000011;
else if (pixel_index == 1000 || pixel_index == 1225 || pixel_index == 1306 || pixel_index == 1310 || pixel_index == 1365 || pixel_index == 1377 || pixel_index == 1406 || pixel_index == 1411 || pixel_index == 1460 || pixel_index == 1577 || pixel_index == 1598 || pixel_index == 1686 || pixel_index == 1694 || pixel_index == 1703 || pixel_index == 1790) oled_data = 16'b0110001100001100;
else if (((pixel_index >= 1001) && (pixel_index <= 1003)) || pixel_index == 1011 || pixel_index == 1021 || pixel_index == 1097 || pixel_index == 1100 || pixel_index == 1197 || pixel_index == 1253 || pixel_index == 1255 || ((pixel_index >= 1260) && (pixel_index <= 1263)) || pixel_index == 1267 || ((pixel_index >= 1269) && (pixel_index <= 1271)) || pixel_index == 1275 || pixel_index == 1280 || pixel_index == 1292 || pixel_index == 1300 || ((pixel_index >= 1302) && (pixel_index <= 1305)) || pixel_index == 1309 || pixel_index == 1312 || ((pixel_index >= 1314) && (pixel_index <= 1316)) || ((pixel_index >= 1321) && (pixel_index <= 1326)) || pixel_index == 1329 || pixel_index == 1331 || pixel_index == 1335 || pixel_index == 1339 || pixel_index == 1348 || pixel_index == 1355 || pixel_index == 1359 || pixel_index == 1363 || pixel_index == 1368 || pixel_index == 1371 || pixel_index == 1376 || pixel_index == 1388 || ((pixel_index >= 1396) && (pixel_index <= 1397)) || pixel_index == 1401 || pixel_index == 1405 || pixel_index == 1408 || pixel_index == 1413 || pixel_index == 1416 || ((pixel_index >= 1421) && (pixel_index <= 1422)) || ((pixel_index >= 1425) && (pixel_index <= 1426)) || pixel_index == 1431 || pixel_index == 1434 || pixel_index == 1450 || pixel_index == 1456 || pixel_index == 1459 || pixel_index == 1464 || pixel_index == 1468 || pixel_index == 1471 || pixel_index == 1483 || pixel_index == 1492 || pixel_index == 1498 || pixel_index == 1501 || pixel_index == 1504 || pixel_index == 1509 || pixel_index == 1512 || pixel_index == 1518 || pixel_index == 1521 || pixel_index == 1530 || pixel_index == 1539 || pixel_index == 1546 || pixel_index == 1552 || pixel_index == 1555 || pixel_index == 1564 || pixel_index == 1567 || pixel_index == 1578 || pixel_index == 1588 || pixel_index == 1594 || pixel_index == 1597 || pixel_index == 1605 || pixel_index == 1608 || pixel_index == 1614 || pixel_index == 1617 || pixel_index == 1624 || pixel_index == 1626 || pixel_index == 1636 || pixel_index == 1643 || pixel_index == 1648 || pixel_index == 1651 || ((pixel_index >= 1661) && (pixel_index <= 1662)) || pixel_index == 1674 || pixel_index == 1684 || pixel_index == 1693 || pixel_index == 1701 || pixel_index == 1704 || ((pixel_index >= 1709) && (pixel_index <= 1710)) || pixel_index == 1713 || ((pixel_index >= 1720) && (pixel_index <= 1721)) || ((pixel_index >= 1732) && (pixel_index <= 1733)) || pixel_index == 1735 || ((pixel_index >= 1739) && (pixel_index <= 1740)) || ((pixel_index >= 1742) && (pixel_index <= 1743)) || pixel_index == 1747 || ((pixel_index >= 1757) && (pixel_index <= 1758)) || ((pixel_index >= 1769) && (pixel_index <= 1770)) || pixel_index == 1772 || ((pixel_index >= 1780) && (pixel_index <= 1782)) || ((pixel_index >= 1784) && (pixel_index <= 1785)) || pixel_index == 1789 || pixel_index == 1797 || pixel_index == 1801 || ((pixel_index >= 1803) && (pixel_index <= 1806)) || pixel_index == 1809 || pixel_index == 1817 || pixel_index == 1864 || pixel_index == 1905 || pixel_index == 1913 || pixel_index == 2008 || (pixel_index >= 2102) && (pixel_index <= 2103)) oled_data = 16'b1111111111111111;
else if (pixel_index == 1004 || pixel_index == 1012 || ((pixel_index >= 1107) && (pixel_index <= 1108)) || pixel_index == 1196 || ((pixel_index >= 1203) && (pixel_index <= 1204)) || pixel_index == 1254 || pixel_index == 1268 || pixel_index == 1299 || pixel_index == 1301 || pixel_index == 1313 || pixel_index == 1330 || pixel_index == 1395 || pixel_index == 1491 || pixel_index == 1517 || ((pixel_index >= 1527) && (pixel_index <= 1528)) || pixel_index == 1560 || pixel_index == 1579 || pixel_index == 1600 || pixel_index == 1625 || pixel_index == 1656 || pixel_index == 1683 || pixel_index == 1685 || ((pixel_index >= 1689) && (pixel_index <= 1690)) || pixel_index == 1696 || pixel_index == 1734 || pixel_index == 1741 || pixel_index == 1752 || pixel_index == 1771 || pixel_index == 1773 || pixel_index == 1779 || pixel_index == 1783 || pixel_index == 1792 || pixel_index == 1802 || pixel_index == 1843 || pixel_index == 1868 || pixel_index == 1893 || pixel_index == 1902 || pixel_index == 1912) oled_data = 16'b1111011110111110;
else if (pixel_index == 1005 || pixel_index == 1116 || pixel_index == 1177 || pixel_index == 1209 || pixel_index == 1214 || pixel_index == 1237 || pixel_index == 1639 || pixel_index == 1719) oled_data = 16'b0100001000001000;
else if (pixel_index == 1013 || pixel_index == 1109 || pixel_index == 1156 || pixel_index == 1180 || pixel_index == 1195 || pixel_index == 1202 || pixel_index == 1374 || pixel_index == 1386 || pixel_index == 1403 || pixel_index == 1466 || pixel_index == 1526 || pixel_index == 1538 || pixel_index == 1852 || pixel_index == 1855 || pixel_index == 1870 || pixel_index == 2200) oled_data = 16'b0010000100000100;
else if (pixel_index == 1020 || pixel_index == 1096 || pixel_index == 1259 || pixel_index == 1266 || pixel_index == 1293 || pixel_index == 1308 || pixel_index == 1311 || pixel_index == 1360 || pixel_index == 1375 || pixel_index == 1435 || ((pixel_index >= 1443) && (pixel_index <= 1444)) || pixel_index == 1503 || pixel_index == 1561 || pixel_index == 1587 || pixel_index == 1599 || pixel_index == 1613 || pixel_index == 1657 || pixel_index == 1660 || pixel_index == 1673 || pixel_index == 1695 || pixel_index == 1753 || pixel_index == 1791 || ((pixel_index >= 1865) && (pixel_index <= 1867)) || pixel_index == 1869 || pixel_index == 1879 || pixel_index == 1885 || pixel_index == 1888) oled_data = 16'b1110111101111101;
else if (pixel_index == 1098 || pixel_index == 1171 || pixel_index == 1174 || pixel_index == 1185 || pixel_index == 1328 || pixel_index == 1424 || pixel_index == 1432 || pixel_index == 1616 || pixel_index == 1702 || pixel_index == 1712 || pixel_index == 1736 || pixel_index == 1768 || pixel_index == 1800 || pixel_index == 1808 || pixel_index == 2009) oled_data = 16'b1011110111110111;
else if (pixel_index == 1099 || pixel_index == 1101 || pixel_index == 1178 || pixel_index == 1192 || pixel_index == 1281 || pixel_index == 1367 || pixel_index == 1458 || pixel_index == 1547 || pixel_index == 1596 || pixel_index == 1635 || pixel_index == 1705 || pixel_index == 1798 || pixel_index == 1836 || pixel_index == 1901 || pixel_index == 2007 || pixel_index == 2198) oled_data = 16'b1100111001111001;
else if (pixel_index == 1117 || pixel_index == 1167 || pixel_index == 1205 || pixel_index == 1357 || pixel_index == 1399 || pixel_index == 1415 || pixel_index == 1505 || pixel_index == 1519 || pixel_index == 1646 || pixel_index == 1649 || pixel_index == 1711 || pixel_index == 1731 || pixel_index == 1828 || pixel_index == 1903) oled_data = 16'b0100101001001001;
else if (pixel_index == 1157 || pixel_index == 1175 || pixel_index == 1232 || pixel_index == 1244 || pixel_index == 1276 || pixel_index == 1400 || pixel_index == 1756 || pixel_index == 1818) oled_data = 16'b1000110001010001;
else if (pixel_index == 1158 || pixel_index == 1165 || pixel_index == 1179 || pixel_index == 1207 || pixel_index == 1213 || ((pixel_index >= 1215) && (pixel_index <= 1216)) || pixel_index == 1219 || pixel_index == 1239 || pixel_index == 1347 || pixel_index == 1349 || pixel_index == 1427 || pixel_index == 1520 || pixel_index == 1589) oled_data = 16'b1011010110110110;
else if (pixel_index == 1159 || pixel_index == 1166 || pixel_index == 1229 || pixel_index == 1356 || pixel_index == 1531 || pixel_index == 1593 || pixel_index == 1607 || pixel_index == 1623 || pixel_index == 1675 || pixel_index == 1832) oled_data = 16'b1010010100110100;
else if (pixel_index == 1160 || pixel_index == 1217 || pixel_index == 1291 || pixel_index == 1327 || pixel_index == 1350 || pixel_index == 1366 || pixel_index == 1419 || pixel_index == 1423 || pixel_index == 1433 || pixel_index == 1508 || pixel_index == 1615 || pixel_index == 1627 || pixel_index == 1807 || pixel_index == 1810 || pixel_index == 1835 || pixel_index == 1906 || pixel_index == 2006) oled_data = 16'b0101001010001010;
else if (pixel_index == 1164 || pixel_index == 1369 || pixel_index == 1455 || pixel_index == 1511 || pixel_index == 1900) oled_data = 16'b1001010010110010;
else if (pixel_index == 1170 || pixel_index == 1193 || pixel_index == 1218 || ((pixel_index >= 1226) && (pixel_index <= 1227)) || ((pixel_index >= 1235) && (pixel_index <= 1236)) || pixel_index == 1482 || pixel_index == 1497 || pixel_index == 1510 || pixel_index == 1522 || pixel_index == 1904) oled_data = 16'b1010110101110101;
else if (pixel_index == 1172 || pixel_index == 1228 || pixel_index == 1410 || pixel_index == 1428 || pixel_index == 1499 || pixel_index == 1502 || pixel_index == 1609 || pixel_index == 1618 || pixel_index == 1688 || pixel_index == 1714 || pixel_index == 1738 || pixel_index == 1886) oled_data = 16'b0101101011001011;
else if (pixel_index == 1173 || pixel_index == 1208 || pixel_index == 1212 || pixel_index == 1279 || pixel_index == 1320 || pixel_index == 1389 || pixel_index == 1398 || pixel_index == 1708 || pixel_index == 1744 || pixel_index == 1897 || pixel_index == 2199) oled_data = 16'b1001110011110011;
else if (pixel_index == 1183 || pixel_index == 1186 || pixel_index == 1352 || pixel_index == 1545 || pixel_index == 1604 || pixel_index == 1677 || pixel_index == 1691 || pixel_index == 1700 || pixel_index == 1706 || pixel_index == 1796 || pixel_index == 1844 || pixel_index == 1892 || pixel_index == 1911 || pixel_index == 1914 || pixel_index == 2101 || pixel_index == 2105) oled_data = 16'b0011000110000110;
else if (pixel_index == 1184 || pixel_index == 1230 || pixel_index == 1233 || pixel_index == 1238 || pixel_index == 1354 || pixel_index == 1420 || pixel_index == 1493 || pixel_index == 1606 || pixel_index == 1829 || pixel_index == 1878 || pixel_index == 1894) oled_data = 16'b1100011000111000;
else if (pixel_index == 1243 || pixel_index == 1317 || pixel_index == 1334 || pixel_index == 1409 || pixel_index == 1412 || pixel_index == 1465 || pixel_index == 1472 || pixel_index == 1484 || pixel_index == 1500 || pixel_index == 1529 || pixel_index == 1554 || pixel_index == 1642 || pixel_index == 1816 || pixel_index == 1842 || pixel_index == 1880 || pixel_index == 1884) oled_data = 16'b1101011010111010;
else if (pixel_index == 1252 || pixel_index == 1256 || pixel_index == 1274 || pixel_index == 1338 || pixel_index == 1362 || pixel_index == 1387 || pixel_index == 1404 || pixel_index == 1451 || pixel_index == 1467 || pixel_index == 1540 || pixel_index == 1566 || pixel_index == 1650 || pixel_index == 1692 || pixel_index == 1722 || pixel_index == 1838 || pixel_index == 1849 || pixel_index == 1887 || pixel_index == 1898) oled_data = 16'b1101111011111011;
else if (pixel_index == 1272 || pixel_index == 1332 || pixel_index == 1364 || pixel_index == 1372 || pixel_index == 1402 || pixel_index == 1407 || pixel_index == 1417 || pixel_index == 1565 || pixel_index == 1647 || pixel_index == 1663 || pixel_index == 1746 || pixel_index == 1788 || ((pixel_index >= 1830) && (pixel_index <= 1831)) || pixel_index == 1837 || pixel_index == 1848 || ((pixel_index >= 1853) && (pixel_index <= 1854)) || ((pixel_index >= 1875) && (pixel_index <= 1876)) || pixel_index == 1899 || pixel_index == 2104) oled_data = 16'b1110011100111100;
else if (Y >= 32 && Y < 37 && X >= 28 && X < 45) begin
    if (first_digit == 2 || first_digit == 3 || first_digit == 5 || first_digit == 6 || first_digit == 7 || first_digit == 8 || first_digit == 9 || first_digit == 0) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 32 && Y < 49 && X >= 28 && X < 33) begin
    if (first_digit == 4 || first_digit == 5 || first_digit == 6 || first_digit == 8 || first_digit == 9 || first_digit == 0) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 44 && Y < 61 && X >= 28 && X < 33) begin
    if (first_digit == 2 || first_digit == 6 || first_digit == 8 || first_digit == 0) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 44 && Y < 49 && X >= 28 && X < 45) begin
    if (first_digit == 2 || first_digit == 3 || first_digit == 4 || first_digit == 5 || first_digit == 6 || first_digit == 8 || first_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 56 && Y < 61 && X >= 28 && X < 45) begin
    if (first_digit == 2 || first_digit == 3 || first_digit == 5 || first_digit == 6 || first_digit == 8 || first_digit == 9 || first_digit == 0) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 32 && Y < 49 && X >= 40 && X < 45) begin
    if (first_digit == 0 || first_digit == 1 || first_digit == 2 || first_digit == 3 || first_digit == 4 || first_digit == 7 || first_digit == 8 || first_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 44 && Y < 61 && X >= 40 && X < 45) begin
    if (first_digit == 0 || first_digit == 1 || first_digit == 3 || first_digit == 4 || first_digit == 5 || first_digit == 6 || first_digit == 7 || first_digit == 8 || first_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 32 && Y < 49 && X >= 53 && X < 58) begin
    if (second_digit == 0 || second_digit == 4 || second_digit == 5 || second_digit == 6 || second_digit == 8 || second_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 44 && Y < 61 && X >= 53 && X < 58) begin
    if (second_digit == 0 || second_digit == 2 || second_digit == 6 || second_digit == 8) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 32 && Y < 49 && X >= 65 && X < 70) begin
    if (second_digit == 0 || second_digit == 1 || second_digit == 2 || second_digit == 3 || second_digit == 4 || second_digit == 7 || second_digit == 8 || second_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 32 && Y < 37 && X >= 53 && X < 70) begin
    if (second_digit == 0 || second_digit == 2 || second_digit == 3 || second_digit == 5 || second_digit == 6 || second_digit == 7 || second_digit == 8 || second_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 44 && Y < 49 && X >= 53 && X < 70) begin
    if (second_digit == 2 || second_digit == 3 || second_digit == 4 || second_digit == 5 || second_digit == 6 || second_digit == 8 || second_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else if (Y >= 56 && Y < 61 && X >= 53 && X < 70) begin
    if (second_digit == 0 || second_digit == 2 || second_digit == 3 || second_digit == 5 || second_digit == 6 || second_digit == 8 || second_digit == 9) begin
    oled_data = 16'b1111100000011111;
    end
end
else oled_data = 0;
end

assign oled_data_output = oled_data;

endmodule
