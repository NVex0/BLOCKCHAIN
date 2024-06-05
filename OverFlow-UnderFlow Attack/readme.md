OverFlow-UnderFlow Attack: Overflows/underflows là lỗi xảy ra khi kết quả trung gian của một phép tính vượt quá giới hạn của kiểu dữ liệu. Điều này có thể dẫn đến kết quả bị sai lệch hoặc không như mong đợi. Trong Solidity, các kiểu dữ liệu như uint và int có giới hạn số bit cố định (ví dụ như uint8 chỉ có 8 bit). Do đó, nếu phép tính trả về kết quả quá giới hạn đó, overflow/underflow sẽ xảy ra.

Ví dụ contract sau:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/40aadd88-ad0e-433a-aeba-df26fb2bb583)

Ta thử giảm value đi xuống âm (balance đang là 0, giảm balance đi 1 ether) với hàm `testUnderFlow()`, lúc này ta thấy giá trị return lại trả về 255:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/4c52a9f4-f1c4-4ffe-b28c-fdd34c618846)

Và thử tăng balance vượt quá giá trị max của uint8 (255), lúc này lại trả về 0:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/3512c181-b4c0-40ec-bb3e-0a182bc8ba92)

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/057427c1-d304-4726-a51c-675a35c3569d)
