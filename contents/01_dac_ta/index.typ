= Đặc tả đề tài

Sử dụng phần mềm Cisco Packet Tracer để thiết kế và mô phỏng một hệ thống cấu trúc liên kết mạng máy tính trong đó các phòng ban khác nhau có một số máy tính ở các tòa khác nhau. Hệ thống được phát triển ở cơ sở chính (Thành phố Hồ Chí Minh) và hai nhánh (Đà Nẵng và Hà Nội) của kiến trúc ngân hàng BB. Những đặc điểm chính của việc sử dụng IT trong công ty được mô tả như sau:
#block()[
     - *Trụ sở chính*:
     #block(inset:(left:1cm))[
        \u{2218} Trụ sở chính bao gồm 7 tầng, tâng 1 bao gồm 1 phòng IT và trung tâm tập trung đường dây kết nối mạng (chi tiết hình bên dưới)
        #figure(caption: [Phòng IT],
            image("../../components/assets/IT_room.jpg")
        )
        #linebreak()
        \u{2218} Quy mô: 120 máy trạm (những máy bàn được đặt sẵn trong công ty để cho nhân viên làm việc), 5 máy chủ, 12 thiết bị mạng (router, switch, repeater,...).
        #linebreak()
        \u{2218} Cơ sở hạ tầng mạng sử dụng các công nghệ mới: kết nối có dây và không dây, cáp quang GPON, và GigaEthernet 1GbE/10GbE. Mạng được tổ chức dựa theo cấu trúc VLAN (chia nhỏ mạng con) cho các phòng ban khác nhau.
        #linebreak()
        \u{2218} Mạng con của trụ sở chính kết nối với 2 mạng con của 2 chi nhánh còn lại (Đà Nẵng và Hà Nội) bằng 2 đường dây riêng (SD-WAN, MPLS) và 2 xDSL để truy cập vào Internet với cơ chế cân bằng tải. Tất cả thiết bị truy cập vào Internet đều đi qua mạng con của Trụ sở chính.
        #linebreak()
        \u{2218} Để mua lại phần mềm, công ty sử dụng kết hợp phần mềm trả phí và mã nguồn mở, ứng dụng văn phòng, mô hình client-server, đa phương tiện và cơ sở dữ liệu.
        #linebreak()
        \u{2218} Yêu cầu bảo mật (tường lửa, IPS/IDS,...), tính sẵn sàng cao, bền vững khi xảy ra sự cố, dễ dàng bảo trì và nâng cấp hệ thống
        #linebreak()
        \u{2218} Đề xuất cấu hình VPN site-to-site (remote) và cho nhân viên làm việc từ xa kết nối với mạng LAN của công ty.
        #linebreak()
        \u{2218} Đề xuất hệ thống camera bảo mật cho hệ thống.
     ]   
     - *Các chi nhánh còn lại*:
     #block(inset:(left:1cm))[
        \u{2218} Tòa nhà có 2 tầng, tầng 1 được trang bị một phòng IT và trung tâm kết nối dây mạng.
        #linebreak()
        \u{2218} Quy mô: 30 máy trạm, 3 máy chủ và 5 thiết bị mạng
     ]
]

Thực hiện kết nối giữa trụ sở chính và các chi nhánh được thực hiện thông qua WAN links như SD-WAN, MPLS,... được chọn theo giá cả.
#block(inset:(left:1cm))[
    - Đề ra những giải pháp với giá cả cụ thể.
    - Phân tích thuận lợi và khó khăn của phương án được lựa chọn.
]

Các luồng dữ liệu và khối lượng công việc của hệ thống (khoảng 80% vào giờ cao điểm từ 9h đến 11h và từ 15h đến 16h) có thể được chia sẻ cho Trụ sở chính và các chi nhánh phụ như sau:
#block(inset:(left:1cm))[
    - Những máy chủ cho việc cập nhật phần mềm, truy cập web, và truy cập cơ sở dữ liệu,... Tổng ước tính tải xuống khoảng 1000MB/ngày và ước tính tải lên là 2000MB/ngày.
    - Mỗi máy trạm được dùng để duyệt web, tải tài liệu và giao dịch với khách hàng,... Tổng ước tính tải xuống khoảng 500MB/ngày và ước tính tải lên là 100MB/ngày.
    - Các thiết bị kết nối Wifi từ truy cập của người dùng cho việc tải tài liệu xuống là khoảng 500 MB/ngày 
    - Phân tích thuận lợi và khó khăn của phương án được lựa chọn.
]

Ngân hàng BB ước tính sẽ gia tăng sự phát triển 20% trong vòng 5 năm về số lượng người dùng, tải mạng, mở rộng chi nhánh,....
#pagebreak()