<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GenyCloud</title>
    % include('templates/csslinks.tpl', title='CSS Links')

</head>

<body>
    <div id="wrapper">

        % include('templates/header.tpl', title='Page header and navigation')

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-13">
                    <h1 class="page-header">Instances</h1>
                </div>
                <!-- /.col-lg-13 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-13">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span><button>Launch</button></span>
                            <span><button>Action</button></span>
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
                                        % for instance in instances:
                                        <tr class="success">
                                            <td>{{instance['VmName']}}</td>
                                            <td>{{instance['VmId']}}</td>
                                            <td>Android</td>
                                            <td>2011-1-1</td>
                                            <td>111</td>
                                            <td>@mdo</td>
                                        </tr>
                                        % end
                                    </tbody>
                                </table>

                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-13 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    % include('templates/jslinks.tpl', title='Javascript Links')

</body>

</html>
