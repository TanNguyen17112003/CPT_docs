= Lược đồ dữ liệu quan hệ

#figure(caption: [Lược đồ dữ liệu quan hệ],
    image("../../components/assets/mapping.png")
)

*Các ràng buộc ngữ nghĩa:*
#block(inset:(left: 1cm))[
    - Khi đặt một loại sản phẩm nào đó, số lượng đặt hàng phải nhỏ hơn hoặc bằng số lượng tồn kho của đơn hàng đó.
    - Khách hàng chỉ có thể nhận được ưu đãi được quy đổi loại 1 khi số lượng của những loại sản phẩm nhất định họ đã mua >= số lượng yêu cầu trong ưu đãi.
    - Tài khoản khách hàng sẽ bị khóa vĩnh viễn nếu họ không thực hiện thanh toán đơn hàng trong khoảng thời gian từ lúc đặt hàng đến khi nhận hàng.
    - Giá bán của mỗi sản phẩm trong đơn hàng không được vượt quá  giá gốc ban đầu. (Giá bán <= giá gốc).
    - Số lượng ưu đãi loại vốn có của mỗi khách hàng phải nhỏ hơn hoặc bằng (<=) số lượng ưu đãi vốn có đó trên toàn bộ hệ thống.
    - Số lượng của mỗi loại ưu đãi có thể áp dụng lên đơn hàng không được vượt quá số lượng tối đa của loại ưu đãi đó.
]
#pagebreak()