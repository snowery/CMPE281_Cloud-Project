<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Genycloud</title>

    <!-- Core CSS - Include with every page -->
    <link href="{{ get_url('/static/<filename:path>', filename='css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{ get_url('/static/<filename:path>', filename='font-awesome/css/font-awesome.css') }}" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Dashboard -->
    <link href="{{ get_url('/static/<filename:path>', filename='css/plugins/morris/morris-0.4.3.min.css')}}" rel="stylesheet">
    <link href="{{ get_url('/static/<filename:path>', filename='css/plugins/timeline/timeline.css')}}" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="{{ get_url('/static/<filename:path>', filename='css/sb-admin.css')}}" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        % include('templates/header.tpl', title='Page header and navigation')

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Instances</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-11">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Context Classes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>name</th>
                                            <th>Instance ID</th>
                                            <th>Instance Type</th>
                                            <th>Instance State</th>
                                            <th>Launch Time</th>
                                            <th>Host Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    % #for instance in instances:
                                        <tr class="success">
                                            <td>{{instances}}</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                             <td>@mdo</td>
                                             <td>@mdo</td>
                                        </tr>
                                    % #end
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="{{get_url('/static/<filename:path>',filename='js/jquery-1.10.2.js')}}"></script>
    <script src="{{get_url('/static/<filename:path>',filename='js/bootstrap.min.js')}}"></script>
    <script src="{{get_url('/static/<filename:path>',filename='js/plugins/metisMenu/jquery.metisMenu.js')}}"></script>

    <!-- Page-Level Plugin Scripts - Dashboard -->
    <script src="{{get_url('/static/<filename:path>',filename='js/plugins/morris/raphael-2.1.0.min.js')}}"></script>
    <script src="{{get_url('/static/<filename:path>',filename='js/plugins/morris/morris.js')}}"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="{{get_url('/static/<filename:path>',filename='js/sb-admin.js')}}"></script>

    <!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
    <script src="{{get_url('/static/<filename:path>',filename='js/demo/dashboard-demo.js')}}"></script>

</body>

</html>
