= Đặc tả đề tài

== Phân tích hệ thống mạng

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

Ngân hàng BB ước tính sẽ gia tăng sự phát triển 20% trong vòng 5 năm về số lượng người dùng, tải mạng, mở rộng chi nhánh,...
#pagebreak()


=  Mô tả kiến trúc hệ thống mạng
== Checklist khảo sát tại khu vực lắp đặt
#block()[
    - Thông tin chung của địa điểm lắp đặt
    #block(inset:(left:1cm))[
        – Xác minh vị trí vật lý lắp đặt của công ty\
        – Xác nhận tổng số tầng và sơ đồ tầng cho từng tòa nhà
    ]
    - Cơ sở hạ tầng
    #block(inset:(left:1cm))[
        – Xác định số lượng và vị trí của các ổ cắm.\
        – Đánh giá tình trạng cơ sở hạ tầng cáp cho dữ liệu và nguồn điện.\
        – Đánh giá khả năng bố trị thiết bị mạng cho từng khu vực.\
    ]
]
== Xác định các vùng có trọng tải lớn
#block(inset:(left:1cm))[
    - Nhóm nhận thấy Trụ sở chính là nơi có lưu lượng mạng cao bởi vì có rất nhiều khách hàng thực hiện dịch vụ, giao dịch hoặc do chính các nhân viên truy cập ứng dụng hay chuyển nhận dữ liệu.
    - Do đó cần sử dụng cân bằng tải tại đây. Giải pháp là đặt thiết bị cân bằng tải Cisco RV082, hoặc cài đặt phần mềm cân bằng tải kết nối trực tiếp với các web server để đảm bảo trang web của hệ thống ngân hàng không bị quá tải. Nếu ta muốn thêm web server mới, thiết bị cân bằng tải sẽ tự động điều chỉnh lưu lượng việc của các server cũ sang server mới được thêm vào, đảm bảo hệ thống không gặp phải vấn đề gì.
    - Ngoài ra có thể cân nhắc thêm cân bằng tải vào những server quan trọng khác như database nếu lưu lượng truy vấn vào database của hệ thống quá lớn.

]

== Lựa chọn cấu trúc mạng phù hợp
=== Thiết kế mạng cho môi trường wireless
Kết nối trụ sở chính với hai chi nhánh thông qua hai leased line với kết nối WAN MPLS và hai xDSL để truy cập Internet với cơ chế cân bằng tải phù hợp
#block()[
    - Leased line:
    #block(inset:(left:1cm))[
        – Mang lại độ tin cậy cao và hiệu suất ổn định vì chúng là các mạch chuyên dụng, giảm thiểu nguy cơ nhiễu hoặc tắc nghẽn.\
        – Cung cấp băng thông được đảm bảo và có thể dự đoán được, đây là yếu tố rất quan trọng đối với các ứng dụng trong lĩnh vực kinh doanh.\
        – An toàn hơn các kết nối dùng chung vì toàn bộ đường dây được dành riêng cho tổ chức, giảm nguy cơ truy cập trái phép hoặc chặn dữ liệu.
    ]
    - WAN MPLS (Multiprotocol Label Switching):
    #block(inset:(left:1cm))[
        – Có thể ưu tiên các loại lưu lượng khác nhau bằng cơ chế QoS, đảm bảo rằng các ứng dụng quan trọng nhận được băng thông cần thiết và độ trễ thấp.\
        – Có khả năng mở rộng, cho phép các tổ chức dễ dàng điều chỉnh băng thông theo nhu cầu ngày càng tăng của họ. Khả năng mở rộng này làm cho MPLS trở thành một giải pháp linh hoạt cho các doanh nghiệp đang phát triển.\
        – Cung cấp kết nối đầu cuối, mang lại trải nghiệm liền mạch cho người dùng ở nhiều địa điểm khác nhau. Điều này có lợi cho các tổ chức có văn phòng phân tán về mặt địa lý.\
        – Cung cấp mức độ bảo mật khi nó hoạt động trong mạng riêng, cách ly lưu lượng truy cập khỏi internet công cộng. Điều này có thể nâng cao tình trạng bảo mật tổng thể của mạng.
    ]
    - xDSL:
    #block(inset:(left:1cm))[
        – So với một số lựa chọn thay thế như kết nối cáp quang, xDSL có thể tiết kiệm chi phí hơn, khiến nó trở thành một lựa chọn phù hợp với kinh tế của các doanh nghiệp.
        – Cung cấp cả tùy chọn bất đối xứng (ADSL) và đối xứng (SDSL). ADSL cung cấp tốc độ tải xuống cao hơn, trong khi SDSL cung cấp tốc độ tải lên và tải xuống bằng nhau, điều này có thể mang lại lợi ích cho một số ứng dụng nhất định.
        – Có thể sử dụng đường dây điện thoại đồng hiện có, giảm thiểu nhu cầu nâng cấp cơ sở hạ tầng đáng kể. Điều này có thể đơn giản hóa việc triển khai và giảm chi phí.
    ]

]
#pagebreak()
== Thiết kế mô hình mạng

#figure(caption: [Mô hình toàn bộ thiết kế],
            image("../../components/assets/MMT.jpg")
        )
#figure(caption: [Thiết kế trụ sở chính TP. Hồ Chí Minh],
            image("../../components/assets/TPHCM.png")
        )
#figure(caption: [Thiết kế chi nhánh Hà Nội],
            image("../../components/assets/HaNoi.png")
        )
#figure(caption: [Thiết kế chi nhánh Đà Nẵng],
            image("../../components/assets/DaNang.png")
        )

#figure(caption: [Web Server],
            image("../../components/assets/Internet.png")
        )
== Thiết kế cấu trúc mạng VLAN và phân vùng chức năng
#block()[
    - Đối với cấu trúc VLAN, tại trụ sở chính và chi nhánh sẽ sử dụng switch tổng đặt ở tầng 1 (phòng IT) để kết nối các switch của từng tầng
    - Nhóm lựa chọn star topology: ở mỗi tầng, các máy giao tiếp với nhau thông qua mạng bằng cách đẩy kết nối đến switch trung tâm ở mỗi tầng. Switch này sẽ thực hiện quản lý và điều hướng tất cả các nguồn dữ liệu ở tầng của mình.
    - Ưu điểm:
    #block(inset:(left:1cm))[
        – Tránh khỏi va chạm, tắc nghẽn nhờ khả năng quản lý tập trung của switch thông minh\
        – Dễ dàng để thêm hoặc tháo một máy tính khác trong mạng, tạo điều kiện cho quá trình sửa chửa, mở rộng sau này\
        – Nếu một máy tính trên mạng gặp sự cố, phần còn lại của mạng vẫn tiếp tục hoạt động bình thường.\
    ]
    - Nhược điểm:
    #block(inset:(left:1cm))[
        – Chi phí cao vì mỗi thiết bị kết nối với switch đều cần dây cáp\
        – Hiệu suất và số lượng nút mà mạng có thể xử lý phụ thuộc vào switch trung tâm\
        – Nếu switch trung tâm gặp sự cố, toàn bộ mạng sẽ bị ngắt kết nối, và tất cả các máy tính sẽ bị ngắt kết nối khỏi mạng.

    ]
    - *Trụ sở chính*:  Hệ thống mạng LAN của ngân hàng được chia thành các mạng VLAN tương ứng với mỗi tầng (mỗi phòng ban). Ngoài ra, các tầng nên được phân chia theo từng phòng ban chức năng khác nhau để dễ quản lý và truyền tải dữ liệu tốt hơn
    #block(inset:(left:1cm))[
        – *Tầng 1: Phòng giao dịch, phòng IT, Cabling Local Central*\
        Là nơi đặt 5 Servers, 10 workstation và các thiết bị mạng. Do các hoạt động giao dịch diễn ra tại tầng 1 nên cần lắp đặt 1 mạng Wireless để cung cấp mạng cho khách.\
        – *Tầng 2-6: Các phòng ban chức năng*\
        Mỗi tầng có các phòng ban chức năng mỗi phòng được cấp 20 workstations, sử dụng Switch 24 ports để kết nối với các máy và làm Switch tổng của từng phòng. Ta vẫn đáp ứng được nhu cầu mở rộng số lượng máy khoảng 20% trong 5 năm.\
        – *Tầng 7: Phòng giám đốc và pháp chế*\
        Được cấp 10 workstations, sử dụng switch 24 ports.
    ]
    - Chi nhánh
    #block(inset:(left:1cm))[
        – *Tầng 1*\
        Là nơi đặt 3 Servers, 10 workstation và các thiết bị mạng.\
        – *Tầng 2*\
        Là nơi đặt 20 workstations còn lại kết nối với Switch 24 ports.
    ]
]

= Danh sách các thiết bị mạng được sử dụng
== Router
=== WRT300N
Linhksys WRT300N với 2 anten chính và một anten vuông lớn đặt giữa để tăng vùng phủ sóng lên đến 4 lần và hạn chế các khu vực mất tín hiệu trong phạm vi bao phủ. Tốc độ mạng không dây chuẩn N nhanh hơn 12 lần so với chuẩn G và hỗ trợ cho các hệ thống không dây khác. Trên thiết bị còn hỗ trợ 4 cổng mạng LAN cho phép chia sẻ với các máy tính không sử dụng mạng không dây. Có cổng USB để cắm USB 3G làm router wifi 3G. Ngoài ra sản phẩm còn hỗ trợ chức năng Repeater (thu sóng và phát lại) tương thích với hầu hết các hãng khác.
#block()[
    - Giá thị trường: Khoảng 500.000 - 1.000.000 VND.
    #figure(caption: [Router WRT300N],
            image("../../components/assets/R.jpg")
        )
]
=== Cisco 1841 Integrated Services Router
Bộ định tuyến Router Cisco 1841 hỗ trợ khoảng 50 người , được thực hiện để đáp ứng nhu cầu của các doanh nghiệp nhỏ và vừa. Router Cisco 1841 có thể giảm chi phí thông qua việc triển khai một hệ thống đàn hồi duy nhất cho nhanh, giao hàng an toàn của nhiều dịch vụ kinh doanh quan trọng, bao gồm: dữ liệu, bảo mật, truyền thông hợp nhất và không dây. Mô hình bộ định tuyến Router Cisco 1841 cung cấp lên đến 2 cổng 10/100 Mbps xây dựng trong đường chuyển, tùy chọn Power over Ethernet (PoE) và hỗ trợ mạng không dây cục bộ (LAN) tiêu chuẩn 802.11a/b/g.

#block()[
    - Giá thị trường cho hàng cũ: khoảng 2.500.000 VND
    #figure(caption: [Cisco 1841 Integrated Services Router],
            image("../../components/assets/C.png")
        )
]
== Access Point
=== AIR-AP3802I-S-K9 Cisco Aironet wireless Access Point
Bộ phát wifi Cisco Aironet AIR-AP3802I-S-K9 access point là bộ phát wifi chuẩn 802.11a/b/g/n/ac với antena được thiết kế ở bên trong thuộc dòng Cisco Aironet wireless 3800 Access Point. Bạn có thể gắn cisco wireless trên bàn hoặc trên tường sử dụng bộ kit đi kèm. Cisco Aironet AIR-AP3802-S-K9 hỗ trợ cả 2 dải tần là 2.4 GHz 4x4 802.11a/g/n MU-MIMO và 5 GHz 4x4 802.11a/g/n MU-MIMO.
#block()[
    - Flexible radio (either 2.4 GHz or 5 GHz):
    #block(inset:(left:1cm))[
        – 2.4 GHz, gain 4 dBi, internal antenna, omnidirectional in azimuth.\
        – 5 GHz, gain 6 dBi, internal directional antenna, elevation plane beamwidth 90°. Dedicated 5-GHz radio\
        – 5 GHz, gain 5 dBi, internal antenna, omnidirectional in azimuth.
    ]
    - Giá thị trường: khoảng 43.000.000 VND
]
#figure(caption: [Cisco Aironet AIR-AP3802I-S-K9 wireless AP],
            image("../../components/assets/AP.jpg", fit: "contain", width: 60%, height: 40%)
        )

== Switch 
=== 2940 24-TT
Thiết Bị Mạng Switch Cisco 24 Port Catalyst 2960 WS-C2960+24TC-L là thiết bị chuyển mạch LAN Base Switch Cisco 2960 24 ports, hỗ trợ 24 x 10/100 cổng, được thiết kế cho các chi nhánh, không gian làm việc văn phòng thông thường và mạng cơ sở hạ tầng

#block()[
    
    #block(inset:(left:1cm))[
        - Cổng giao tiếp: Catalyst 2960+24TC-L 24 Ethernet 10/100 + 2 dual-purpose Ports (10/100/1000 or SFP) LAN Base software.
        - Tốc độ LAN: 10/100Mbps.
        - Giá thị trường: Khoảng 15.000.000 VND.
    ]
]
#figure(caption: [Switch CISCO Catalyst 2960 WS-C2960-24TT-L],
            image("../../components/assets/switch.png", fit: "contain" )
        )


=== Cisco Catalyst 3650 Stackable 24-Port Switch
Cisco WS-C3650-24TS-S được tích hợp với 24 cổng Ethernet và 4 x 1G cổng Uplink SFP trong bộ tính năng IP Base.Thiết bị chuyển mạch Switch Cisco WS-C3650-24TS-S có dải băng thông lên đến 160Gpbs, tốc độ chuyển tiếp băng thông 41,66Mpbs, Công suất chuyển mạch 88 Gbps, được ứng dụng công nghệ Cisco StackWise – 160 có thể xếp 9 công tắc và hỗ trợ băng thông Stack 160 Gpbs.
#block()[
    - Giá thị trường cho 1 thiết bị: Khoảng 40.000.000 - 60.000.000 VND.\
]
#figure(caption: [Cisco Catalyst 3650 Stackable 24-Port Switch],
            image("../../components/assets/24.png", fit: "contain" )
        )

== Dây kết nối
=== Dây cáp mạng Cat5e
Dây cáp để kết nối là một thiết bị không thể thiếu để kết nối hệ thống mạng lại với nhau. Đề xuất sử dụng cáp cat5e có khả năng truyền dữ liệu lớn với tốc độ lên tới 1000 Mbps và giảm độ nhiễu đáng kể trong quá trình dẫn truyền tín hiệu.

#figure(caption: [Dây cáp mạng Cat5e],
            image("../../components/assets/5e.png", fit: "contain" )
        )

=== Cáp quang
Do yêu cầu kiến trúc hệ thống GPON, tuy nhiên Packet Tracer không hỗ trợ đủ thiết bị để hiện thực nối cáp quang toàn hệ thống, tuy nhiên nhóm vẫn cố gắng hiện thực GPON ở những chỗ có thể.
#figure(caption: [Dây cáp mạng Cat5e],
            image("../../components/assets/capquang.png", fit: "contain" )
        )

#pagebreak()
= Định nghĩa VLAN cho trụ sở chính và hai chi nhánh
== Trụ sở chính

#table(
    columns: (auto, auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [VLAN], [Phòng ban], [IP Address], [IP start - end], [Broadcast],
    [10],   [Phòng dịch vụ khách hàng], [192.168.1.0/24], [192.168.1.1 - 192.168.1.62], [192.168.11.63],
    [20],   [Phòng IT], [192.168.2.0/24], [192.168.2.1 - 192.168.2.62], [192.168.2.63],
    
    [30],   [Tầng 2], [192.168.3.0/24], [192.168.3.1 - 192.168.3.62], [192.168.3.63],
    [40],   [Tầng 3], [192.168.4.0/24], [192.168.4.1 - 192.168.4.62], [192.168.4.63],
    [50],   [Tầng 4], [192.168.5.0/24], [192.168.5.1 - 192.168.5.62], [
    192.168.5.63],
    [60],   [Tầng 5], [192.168.6.0/24], [192.168.6.1 - 192.168.6.62], [
    192.168.6.63],
    [70],   [Tầng 6], [192.168.7.0/24], [192.168.7.1 - 192.168.7.62], [
    192.168.7.63],
    [80],   [Phòng giám đốc và pháp chế], [192.168.8.0/24], [192.168.8.1 - 192.168.8.62], [192.168.8.63],
   
)
Ngoài các VLAN và địa chỉ IP ở trên, ở trụ sở còn có một số khoảng IP khác như sau:
#table(
    columns: (auto, auto),
    inset: 10pt,
    align: horizon,
    [100.0.0.0/24],[Địa chỉ IP của các server],
    [10.10.10.0/24],[Địa chỉ IP kết nối router chính của trụ sở tới mạng LAN nội bộ của trụ sở],
    [192.168.1.0/24],[Địa chỉ IP dành cho máy khách],
    [10.0.1.1/24 và 10.0.0.1/24],[Địa chỉ IP kết nối router chính của trụ sở tới hai chi nhánh],
    [20.110.24.0/24],[Địa chỉ IP kết nối trụ sở với Internet]
)

== Chi nhánh Hà Nội

#table(
    columns: (auto, auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [VLAN], [Phòng ban], [IP Address], [IP start - end], [Broadcast],
    [120],   [Phòng dịch vụ khách hàng ], [192.170.1.0/24], [192.170.1.1 - 192.170.1.62], [192.170.1.63],
    [130],   [Tầng 1], [192.170.2.0/24], [192.170.2.1 - 192.170.10.62], [192.170.2.63],
    [140],   [Tầng 2], [192.170.3.0/24], [192.170.3.1 - 192.170.20.62], [192.170.3.63],
   
)

== Chi nhánh Đà Nẵng

#table(
    columns: (auto, auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [VLAN], [Phòng ban], [IP Address], [IP start - end], [Broadcast],
    [90],   [Phòng dịch vụ khách hàng ], [192.169.1.0/24], [192.169.1.1 - 192.169.1.62], [192.169.1.63],
    [100],   [Tầng 1 ], [192.169.2.0/24], [192.169.2.1 - 192.169.2.62], [192.170.2.63],
    [110],   [Tầng 2], [192.169.3.0/24], [192.169.3.1 - 192.169.3.62], [192.169.3.63],
   
)


#pagebreak()


= Tính toán thông lượng, băng thông và các thông số an toàn của hệ thống mạng
#block()[
    - Throughput (Thông lượng) : thông lượng mạng đề cập đến lượng dữ liệu có thể được truyền từ nguồn đến đích trong một khung thời gian nhất định. Công suất thông lượng được đo bằng bit trên giây, nhưng nó cũng có thể được đo bằng dữ liệu trên giây
    - Bandwidth (Băng thông) : Định nghĩa băng thông mạng có thể gây nhầm lẫn, nhưng về cơ bản, băng thông mạng được định nghĩa là dung lượng thông lượng truyền tối đa của mạng. Đó là thước đo lượng dữ liệu có thể được gửi và nhận tại một thời điểm. Băng thông được đo bằng bit, megabit hoặc gigabit trên giây. Khi mọi người sử dụng các chương trình hoặc phần mềm, họ muốn các yêu cầu của họ được lắng nghe và đáp ứng kịp thời. Các gói bị mất khi truyền dẫn đến hiệu suất mạng kém. Sử dụng thông lượng để đo tốc độ mạng rất tốt cho việc khắc phục sự cố vì nó có thể tìm ra nguyên nhân chính xác của mạng chậm và cảnh báo cho quản trị viên về các vấn đề cụ thể liên quan đến mất gói.
    - Việc tính toán thông lượng và băng thông của mạng là cần thiết, bởi nó sẽ cho chúng ta biết thiết kế mạng đã đáp ứng được những yêu cầu dịch vụ mà hệ thống mạng cung cấp hay chưa và có thể điều chỉnh sao cho phù hợp. Các yêu cần dịch vụ mà hệ thống cần đáp ứng như là:
    #block(inset:(left:1cm))[
        – Truy cập Internet lướt web, chạy các ứng dụng khác trên máy tính, điện thoại thông minh.\
        – Nhận và hồi đáp yêu cầu Web Server từ bên ngoài, hoặc nội bộ trong ngân hàng.\
        – Nhận yêu cầu dữ liệu từ các trụ sở khác của ngân hàng.\
        – Gửi mail, các dịch vụ gửi tin nhắn khác
    ]
]
== Trụ sở chính
Các thông số về lưu lượng và tải của hệ thống tập trung khoảng 80% vào giờ cao điểm 9h-11h và 15g-16h. (3 giờ)
#block()[
    - Lượng upload và download 3000MB/ngày cho mỗi Server. Ở trụ sở chính chúng ta có 5 Server, tổng dung lượng upload và download : 5*3000=15000 (MB)
    - Với mỗi Workstation có tổng dung lượng upload và download khoảng 600MB/ngày. Chúng ta có 120 Workstations: tổng dung lượng cần đáp ứng cho các Workstations: 120*600=72000 (MB/ngày). Với mạng không dây: mỗi laptop kết nối khoảng 500 MB/ngày. Giả sử trụ sở chính có khoảng 200 thiết bị mạng truy cập mỗi ngày. Tổng dung lượng cho mạng Wireless: 500*200=100000 (MB/ngày).
]
Tại các giờ cao điểm, đường truyền mạng hoạt động hết công suất, và thông lượng tại các thời điểm này có giá trị cao nhất và đây cũng là giá trị gần với băng thông của mạng nhất, lưu lượng qua mạng tại những thời điểm này chiếm 80% toàn bộ dung lương qua mạng trong ngày
#block()[
    - Bandwidth: ((15000 + 72000 + 100000) \* 0.8)/(3 \* 3600) = 13.852 (MB/s) = 110.815 (Mb/s).
    - Throughput: (15000 + 72000 + 100000)/(24 \* 3600) = 2.164 MB/s= 17.315 (Mb/s)
]
== Trụ sở chi nhánh
Các thông số về lưu lượng và tải của hệ thống tập trung khoảng 80% vào giờ cao điểm 9h-11h và 15g-16h. (3 giờ).
#block()[
    - Lượng upload và download 3000MB/ngày cho mỗi Server. Ở trụ sở chính chúng ta có 3 Server, tổng dung lượng upload và download : 3*3000=9000 (MB)
    - Với mỗi Workstations có tổng dung lượng upload và download khoảng 600MB/ngày.Chúng ta có 30 Workstations: tổng dung lượng cần đáp ứng cho các Workstations: 30*600=18000 (MB/ngày). Với mạng không dây: mỗi laptop kết nối khoảng 500MB/ngày. Giả sử trụ sở chi nhánh có khoảng 150 thiết bị mạng truy cập mỗi ngày. Tổng dung lượng cho mạng Wireless: 500*150=75000 (MB/ngày).
]
Tại các giờ cao điểm, đường truyền mạng hoạt động hết công suất, và thông lượng tại các thời điểm này có giá trị cao nhất và đây cũng là giá trị gần với băng thông của mạng nhất, lưu lượng qua mạng tại những thời điểm này chiếm 80% toàn bộ dung lương qua mạng trong ngày
#block()[
    - Bandwidth: ((9000+18000 +75000) \* 0.8)/(3*3600) = 7.556 (MB/s) = 60.444 (Mb/s).
    - Throughput: (9000+18000 +75000)/(24*3600) = 1.181 (MB/s) = 9.444 (Mb/s).
]
Ước tính sau 5 năm hệ thống tăng thêm 20%:\
- Trụ sở chính
#block()[
    – Bandwidth: 13.820*1.2 = 16.6224 (MB/s) = 132.978 (Mb/s)\
    – Throughput: 2.164*1.2 = 2.597 (MB/s) = 20.778 (Mb/s)
]
- Trụ sở chi nhánh 
#block()[
    – Bandwidth: 7.556*1.2 = 9.067 (MB/s) = 72.533 (Mb/s)\
    – Throughput: 1.181*1.2 = 1.42 (MB/s) = 11.333 (Mb/s)
]

#pagebreak()
= Mô phỏng hệ thống mạng trên Packet Tracer
Các bước thực hiện
#block()[
    1. Lựa chọn các thiết bị mạng cần sử dụng
    2. Thiết kế sơ đồ mạng LAN của trụ sở và chi nhánh theo mô tả kiến trúc ở phần trên
    3. Cấu hình VLAN cho các tầng và thiết lập DHCP tại Multilayer Switch trung tâm để cấp IP private động cho các thiết bị
    4. Cấu hình tưởng lửa để phân quyền truy cập cho các vùng inside, outside và dmz
    5. Cấu hình và phân quyền camera giám sát
    6. Liên kết các trụ sở và chi nhánh trong mạng WAN với Leased Line
    7. Kết nối mạng LAN tại trụ sở và chi nhánh ra Internet qua Modem theo đường truyền của nhà cung cấp dịch vụ Internet
    8. Định tuyến các Router
    9. Thực hiện kiểm thử
]
*Sơ đồ mô phỏng hệ thống mạng của toàn bộ hệ thống*
#figure(caption: [ Sơ đồ mô phỏng hệ thống mạng của toàn bộ hệ thống],
            image("../../components/assets/sodomain.png"))
       
*Sơ đồ mô phỏng hệ thống mạng của trụ sở chính TP.HCM*
#figure(caption: [Sơ đồ luận lý thiết kế mạng trụ sở chính],
            image("../../components/assets/trusochinh.png" )
        )
       
*Sơ đồ mô phỏng hệ thống mạng của chi nhánh Hà Nội*
#figure(caption: [Sơ đồ luận lý thiết kế mạng chi nhánh Hà Nội],
            image("../../components/assets/chinhanhHaNoi.png")
        )

*Sơ đồ mô phỏng hệ thống mạng của chi nhánh Đà Nẵng*
#figure(caption: [Sơ đồ luận lý thiết kế mạng chi nhánh Đà Nẵng],
            image("../../components/assets/chinhanhDN.png")
        )

#pagebreak()
= Kiểm thử kiến trúc mạng
== Kiểm tra bằng lệnh ping
=== Trong cùng một VLAN
Ping từ PC-1 có địa chỉ IP 192.168.2.4 đến PC-3 có địa chỉ IP 192.168.2.2 trong cùng VLAN 20:
#figure(caption: [Ping trong cùng VLAN ITROOM],
            image("../../components/assets/pingVLAN.png")
        )
=== Giữa hai VLAN khác nhau trong cùng một chi nhánh
Ping từ PC-1 có địa chỉ IP 192.168.2.4 trong VLAN 20 đến RM PC-2 có địa chỉ IP 192.168.7.2 trong VLAN 70:
#figure(caption: [Ping hai VLAN khác nhau ITROOM đến RM],
            image("../../components/assets/VLAN ChiNhanh.png")
        )


=== Giữa VLAN và Server trong cùng một chi nhánh      
Ping từ FINACE PC-1 có địa chỉ IP 192.168.5.3 trong VLAN 50 đến Mail Server có địa chỉ IP 100.0.0.4:
#figure(caption: [Ping VLAN và Server trong cùng một chi nhánh],
            image("../../components/assets/VLAN Server.png")
        )

=== Giữa một thiết bị ở chi nhánh này với thiết bị ở chi nhánh khác
Ping từ PC-1 có địa chỉ IP 192.168.2.4 của phòng IT trụ sở chính đến PC-1 có địa chỉ IP 192.169.2.2 của phòng IT chi nhánh Đà Nẵng:
#figure(caption: [Ping giữa hai chi nhánh],
            image("../../components/assets/pingChiNhanh.png")
        )

=== Kiểm tra kết nối internet

Ping từ HR PC-1 với địa chỉ IP 192.168.4.4 tới địa chỉ của Google.com với địa chỉ 11.11.11.1 thông qua
mạng internet:
#figure(caption: [Ping kiểm tra kết nối internet],
            image("../../components/assets/pingInternet.png")
        )
#pagebreak()
== Kiểm tra bằng cách gửi một packet PDU thông qua giao thức ICMP






#pagebreak()
== Kiểm tra bằng lệnh tracert
=== Trong cùng một VLAN
#figure(caption: [Tracert trong cùng VLAN],
            image("../../components/assets/tracertVLAN.png")
        )
=== Giữa hai VLAN khác nhau trong cùng một chi nhánh
#figure(caption: [Tracert hai VLAN khác nhau ITROOM đến RM],
            image("../../components/assets/tracertChiNhanh.png")
        )

=== Giữa VLAN và Server trong cùng một chi nhánh
#figure(caption: [Tracert VLAN và Server trong cùng một chi nhánh],
            image("../../components/assets/tracertVLANServer.png")
        )

===  Giữa một thiết bị ở chi nhánh này với thiết bị ở chi nhánh khác
#figure(caption: [Tracert giữa hai chi nhánh],
            image("../../components/assets/tracertChiNhanh_.png")
        )

=== Kiểm tra kết nối internet
#figure(caption: [Tracert kiểm tra kết nối internet],
            image("../../components/assets/tracertInternet.png")
        )

#pagebreak()