Ta sẽ đi thẳng vào ví dụ của loại tấn công từ chối dịch vụ này. Ta có contract sau mô phỏng hệ thống đấu giá:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/2fbadeb9-7e23-4c6b-ae42-45e10d21198b)

Hệ thống có chức năng đấu giá, lưu giá trị cao nhất được bid kèm địa chỉ từ người bid. Nếu có người trả giá cao hơn thì trả lại tiền cho người bid cao nhất trước đó.

Và contract của Attacker:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/c2d75408-d63a-4cf7-897b-4a7e88af2493)

##### Cách thức hoạt động:

+ Giả sử sau khi hệ thống được deploy, người A bid 1 ether.

+ Tiếp tục người B bid 2 ether, 1 ether kia được trả về cho A.

+ Lúc này attacker sẽ bid 3 ether, attacker hiện là người bid cao nhất, 2 ether được trả về cho người B.

+ Lúc này có 1 người C bid 5 ether, hệ thống sẽ tiến hành trả tiền về cho attacker. Tuy nhiên, cốt lõi là ở đây, contract của attacker không có cả `receive()` lẫn `fallback()` function -> điều này dẫn tới hệ thống không trả tiền được cho attacker và return fail cho người C.

+ Khi này hệ thống sẽ bị đình trệ, không ai có thể bid cao hơn được do hệ thống luôn trả về fail khi trả tiền cho attacker. Tức là attacker đang giữ trạng thái "luôn bid cao nhất".

##### Demo:

[DoS revert attack](https://drive.google.com/file/d/1go4YpysiQdm9fmAr582tUI9_56UtG13z/view?usp=sharing)

##### Phương pháp ngăn chặn:

+ Thay vì chuyển tiền về cho bidder, sử dụng 1 hệ thống cho phép rút tiền thay thế (pull payment system). Ví dụ như với kịch bản bên trên, phương án cho pull payment system như sau:

  ![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/ec7af3a1-f992-4609-a717-2425a393bedd)

  sử dụng `withdraw()` function để làm pull payment system. Ngoài ra Balance của phiên sẽ là tổng tất cả các lần bid và chỉ cho phép những người bid bé hơn highest bid hiện tại được rút:

  ![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/e3d8efb3-f789-4587-9547-762cbdeb7cbd)

  ##### Demo hoạt động:

  [DoS revert attack prevent](https://drive.google.com/file/d/1rJus5dhkpryaGQIV-u60SWBjogdqbSg4/view?usp=sharing)


  
