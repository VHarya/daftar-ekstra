<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
        Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
</footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/dist/js/adminlte.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script>
    $('#example1').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": true,
        "pageLength": 5,
        "ordering": false,
        "info": false,
        "autoWidth": false,
        "responsive": true,
    });
</script>

<script src="{{ URL::to('/') }}/main.js"></script>

</body>
</html>
