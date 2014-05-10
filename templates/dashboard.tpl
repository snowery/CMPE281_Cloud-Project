<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>GenyCloud</title>

    % include('templates/csslinks.tpl', title='CSS Links')

</head>

<body>

    <div id="wrapper">

        % include('templates/header.tpl', title='Page header and navigation')

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Overview</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Resource
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <h4><a href="/1/instances">Instances</a>: Running {{running}}, Total {{total}}</h4><br/>
                            <button>Launch Instance</button>
                            <div>Plan</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Timeline
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                            % for log in logs:
                                % if log['on']:
                                    <li>
                                        <div class="timeline-badge warning"><i class="fa fa-play"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="timeline-title">Power on {{log['VmName']}}</h4>
                                % else:
                                    <li class="timeline-inverted">
                                        <div class="timeline-badge"><i class="fa fa-stop"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="timeline-title">Power off {{log['VmName']}}</h4>
                                % end
                                            <p>
                                                <small class="text-muted"><i class="fa fa-time"></i> {{log['time']}} </small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Instance ID: {{log['VmId']}}</p>
                                        </div>
                                    </div>
                                </li>
                            % end
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    % include('templates/jslinks.tpl', title='Javascript Links')
</body>

</html>
