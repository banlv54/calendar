Bootstrap Calendar
===

## Hướng dẫn sử dụng với Ruby on Rails

Có thể rất nhiều bạn đã nhìn thấy calendar quen thuộc này, và thấy nó nhìn rất hay và đẹp. Nhưng lại không biết làm thế nào để áp dụng vào trang web của mình. Vì nó không phải là một gem như bootstap mà chúng ta có thể install như bình thương.

Bài viết này của mình sẽ hướng dẫn các bạn cách cài đặt và sửa dụng Bootstrap Calendar một cách chi tiết và đơn giản  nhất để các bạn có thể sử dụng được ngay. Mình sẽ sử dụng Ruby on Rails để demo. Nhưng mình tin là sau khi đọc nó thì các bạn có thể sử dụng với bất kỳ ngôn ngữ web nào mà bạn biết.

## II) Chuẩn bị
Vâng, việc đầu tiên mà chúng ta cần làm đó chính là clone [source code](https://github.com/Serhioromano/bootstrap-calendar) của nó về để sử dụng. Chúng ta phải copy các file css, js từ source code của họ để import vào project của chính mình. Nhưng mà ở đó có rất nhiều file, chúng ta phải copy những file nào? Tất cả ư? Không, câu trả lời đó rất là hiển nhiên rồi. Trong source code có rất nhiều thư viện mà ở project của chúng ta đã có sẵn nên không việc gì phải lấy tất cả. Dưới đây mình xin liệt kê những file cần thiết:
- *calendar.js hoặc calendar.min.js (thư mục bootstrap-calendar-master/js)
- *underscore-min.js (thư mục bootstrap-calendar-master/components/underscore)
- *calendar.css hoặc calendar.min.css (thư mục bootstrap-calendar-master/css)
- *thư mục tmpls (nên đặt ở public để có thể truy cập vào các file html một các nhanh nhất mà không cần thêm router) đây chính là các file template để calendar sử dụng và view cho chúng ta)

Trên đây là những file bắt buộc phải có với  các ứng dụng web. Ngoài ra thì chúng ta phải thêm css của bootsstrap nếu như các bạn không cài gem của bootstrap
- bootstrap.css (thư mục components/bootstrap2/css hoặc components/bootstrap3/css)

### III) Cách dùng
Có khá nhiều các khởi tạo một calendar với các cách load events khác nhau. Mình chỉ nói 2 cách đơn giản nhất là:
####1) Hard code
Bạn truyền ngay mảng event vào trong events_source như dưới đây là xong
```HTML
    <div id="calendar"></div>
    $("#calendar").calendar({
        tmpl_path: "/tmpls/",
        events_source: [
        {
          "id": 1,
          "title": "Title 0",
          "url": "/to_dos/1",
          "class": "event-warning",
          "start": 1469620406000,
          "end": 1469620466000
        },
        {
          "id": 2,
          "title": "Title 1",
          "url": "/to_dos/2",
          "class": "event-important",
          "start": 1469620466000,
          "end": 1469620526000
        }
      ]
    });
```
```HTML
    <div id="calendar"></div>
    $("#calendar").calendar(
        {
          tmpl_path: "/tmpls/",
          events_source: function(){
              return [
            {
              "id": 1,
              "title": "Title 0",
              "url": "/to_dos/1",
              "class": "event-warning",
              "start": 1469620406000,
              "end": 1469620466000
            },
            {
              "id": 2,
              "title": "Title 1",
              "url": "/to_dos/2",
              "class": "event-important",
              "start": 1469620466000,
              "end": 1469620526000
            }
          ];
      }
    });
```
Như trên ta thấy, chỉ cần trong events_source có được mảng data dưới dạng json nđúng format là được.
####2) Fectch url
Cách này đơn giản hơn rất nhiều và mình nghĩ nó sẽ được sử dụng nhiều nhất. Đó chính là truyền vàoevents_source một url là nó sẽ tự động fetch dữ liệu về để hiển thị.  Và dĩ nhiên là hành động fetch đó sẽ là method get với format json.
```HTML
    <div id="calendar"></div>
    $("#calendar").calendar({
          tmpl_path: "/tmpls/",
          events_source: "/index"
    });
```
Dữ liệu khi trả về có dạng:
```
{
  "success": 1,
  "result": [
    {
      "id": 1,
      "title": "Title 0",
      "url": "/to_dos/1",
      "class": "event-warning",
      "start": 1469620406000,
      "end": 1469620466000
    },
    {
      "id": 2,
      "title": "Title 1",
      "url": "/to_dos/2",
      "class": "event-important",
      "start": 1469620466000,
      "end": 1469620526000
    }
  ]
}
```

#### Giải thích
Vâng, cách dùng thì đơn giản. Nhưng những dữ liệu đó có ý nghĩa gì và để làm gì.
- title: chính là title sẽ hiển thị ra tượng trung cho event mà bạn muốn tạo khi chúng ta click vào một ngày nào đó (tuần hoặc tháng)
- url: Chính là đường dẫn mà bạn muốn người dùng đến khi click vào title của event đó (hoặc có thể nội dung hiển thị  của trang web đó sẽ được hiển thị lên modal - đọc tiếp sẽ rõ :v)
- class: Chính là class trên view của event. Mỗi class sẽ có một mầu khác nhau để các bạn phân biệt được chúng (chúng có thể giúp bạn phân biệt sự quan trọng của công việc đo)
- start: Đây là thời gian bắt đầu thực hiện công việc.
- end: thời gian kết thúc công việc
Khi hiển thì calendar theo từng ngày một thì bạn có thể thấy được độ dài công việc một cách trực quan nhất. Với các cahs hiển thị khác thì nó sẽ là một dấu chấm xác định công việc thuộc ngày đó.

Vâng, ở trên mình có đề cập tới việc nội dung url sẽ được hiển thị lên modal. Vậy cách dùng của nó ra sao?
Việc này mình cũng có thể nói là khá đơn giản. Bạn chỉ cần thêm view và option khi khơi tạo là xong
```html
<div class="modal hide fade" id="events-modal">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      <h3>Detail for ToDo</h3>
    </div>
    <div class="modal-body" style="height: 400px">
    </div>
    <div class="modal-footer">
      <a href="#" data-dismiss="modal" class="btn">Close</a>
    </div>
  </div>
  <script type="text/javascript">
    $('#calendar').calendar({
        modal: "#events-modal",
        tmpl_path: "/tmpls/",
        events_source: "index"
    });
  </script>
```

Còn một vấn đề nữa mà mình cũng đã từng đề cập đó là cách hiển thị của calendar. Vậy có những cách hiển thị nào?
Đó là: Hiển thị theo năm, theo tháng, theo tuần và theo ngày. Dùng nó như sau:
```HTML
<div class="pull-right form-inline">
  <div class="btn-group">
    <button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
    <button class="btn" data-calendar-nav="today">Today</button>
    <button class="btn btn-primary" data-calendar-nav="next">Next >></button>
  </div>
  <div class="btn-group">
    <button class="btn btn-warning" data-calendar-view="year">Year</button>
    <button class="btn btn-warning active" data-calendar-view="month">Month</button>
    <button class="btn btn-warning" data-calendar-view="week">Week</button>
    <button class="btn btn-warning" data-calendar-view="day">Day</button>
  </div>
</div>
<script type="text/javascript">
  var calendar = $('#calendar').calendar(
    {
      modal: "#events-modal",
      tmpl_path: "/tmpls/",
      events_source: "index"
    }
  );

  $('.btn-group button[data-calendar-nav]').each(function() {
    var $this = $(this);
    $this.click(function() {
      calendar.navigate($this.data('calendar-nav'));
    });
  });

  $('.btn-group button[data-calendar-view]').each(function() {
    var $this = $(this);
    $this.click(function() {
      calendar.view($this.data('calendar-view'));
    });
  });
</script>
```

Trên đây là một số hướng dẫn đơn giản để các bạn có thể tạo một ứng dụng web sử dụng calendar của boostrap. Các bạn có thể tham khảo một cách chi tiết và đầy đủ hơn ở https://github.com/Serhioromano/bootstrap-calendar

Bản demo của mình ở đây https://banlv54-calendar.herokuapp.com/
