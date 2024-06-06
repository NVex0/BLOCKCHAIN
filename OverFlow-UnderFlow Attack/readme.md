OverFlow-UnderFlow Attack: Overflows/underflows là lỗi xảy ra khi kết quả trung gian của một phép tính vượt quá giới hạn của kiểu dữ liệu. Điều này có thể dẫn đến kết quả bị sai lệch hoặc không như mong đợi. Trong Solidity, các kiểu dữ liệu như uint và int có giới hạn số bit cố định (ví dụ như uint8 chỉ có 8 bit). Do đó, nếu phép tính trả về kết quả quá giới hạn đó, overflow/underflow sẽ xảy ra.

Ví dụ contract sau:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/46332d90-451b-4df0-92b0-8fd90efa6faa)

Ta thử giảm value đi xuống âm (balance đang là 0, giảm balance đi 1 ether) với hàm `testUnderFlow()`, lúc này ta thấy giá trị return lại trả về 255:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/4c52a9f4-f1c4-4ffe-b28c-fdd34c618846)

Và thử tăng balance vượt quá giá trị max của uint8 (255), lúc này lại trả về 0:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/057427c1-d304-4726-a51c-675a35c3569d)

##### Demo Attack:

[Overflow-Underflow Attack](https://drive.google.com/file/d/1gbFQNdkkHlnjIViOHcrQlNM629AVUNWX/view?usp=sharing)

##### Biện pháp ngăn chặn:

+ Thêm 1 hàm xử lý với các giá trị vượt khoảng cho phép của kiểu đó.

  Define các giá trị chặn khoảng:

  ![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/93e9c0ad-1130-4084-b7db-6ff43c925ab4)

  Nếu giá trị mới vượt giá trị chặn thì trả về failed, require không thỏa mãn:

  ![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/2e3924dd-9985-47e2-b793-c1f539955c47)

  ###### Demo ngăn chặn:

  [Overflow-Underflow Prevent](https://drive.google.com/file/d/1BUCNuxUJzpN4Q9e2zt4RfPlbaf31_5QC/view?usp=sharing)

+ Sử dụng thư viện SafeMath trong code.

  [Safe Math](https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol)
