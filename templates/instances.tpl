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
            <div class="row" id="chooseImage"  style="display:none ">
                <div class="row" style="margin-left: 15px;">
                    <h1>Choose Image</h1>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="cuadro_intro_hover " style="background-color:#cccccc;">
                            <p style="text-align:center; margin-top:20px;">
                                <img src="http://placehold.it/500x330" class="img-responsive" alt=""/>
                            </p>
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">Google Galaxy Nexus</h3>
                                    <p>Android Version : 4.1.1</p>
                                    <p>Screen Size : 720 X 1280</p>
                                    <p>Memory / Storge : 1024M / 16384M</p>
                                    <a class=" btn btn-default" data-toggle="modal" data-target="#myModal" href="#"><span class="glyphicon glyphicon-plus"> SELECT</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="cuadro_intro_hover " style="background-color:#cccccc;">
                            <p style="text-align:center; margin-top:20px;">
                                <img src="http://placehold.it/500x330" class="img-responsive" alt="" />
                            </p>
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">HTC Evo</h3>
                                    <p>Android Version : 4.2.2</p>
                                    <p>Screen Size : 720 X 1280</p>
                                    <p>Memory / Storge : 2048M / 16384M</p>
                                    <a class=" btn btn-default" data-toggle="modal" data-target="#myModal" href="#"><span class="glyphicon glyphicon-plus"> SELECT</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="cuadro_intro_hover " style="background-color:#cccccc;">
                            <p style="text-align:center; margin-top:20px;">
                                <img src="http://placehold.it/500x330" class="img-responsive" alt="" />
                            </p>
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">Motorola Moto X</h3>
                                    <p>Android Version : 4.2.2</p>
                                    <p>Screen Size : 720 X 1280</p>
                                    <p>Memory / Storge : 2048M / 16384M</p>
                                    <a class=" btn btn-default" data-toggle="modal" data-target="#myModal" href="#"><span class="glyphicon glyphicon-plus"> SELECT</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="cuadro_intro_hover " style="background-color:#cccccc;">
                            <p style="text-align:center; margin-top:20px;">
                                <img src="http://placehold.it/500x330" class="img-responsive" alt="" />
                            </p>
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">Samsung Galaxy Note</h3>
                                    <p>Android Version : 4.2.2</p>
                                    <p>Screen Size : 720 X 1280</p>
                                    <p>Memory / Storge : 2048M / 16384M</p>
                                    <a class=" btn btn-default" data-toggle="modal" data-target="#myModal" href="#"><span class="glyphicon glyphicon-plus"> SELECT</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" id="instancesTable">
                <div class="col-lg-13">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <span ><button id="launchInstance" >Launch</button></span>
                            <span><button>Action</button></span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" name="checkbox"/></th>
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
                                            <td><input type="checkbox" name="checkbox"/></td>
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


   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title" id="myModalLabel" style="text-align: center;">Select a Plan</h2>
                </div>
                <div class="modal-body">

                    <form id="lauchInstanceForm" action="/1/instances/launch" method="POST" >
                         <div class="span1 col-md-6">
                            <div class="well">
                                <h2 class="text-warning">On Demond</h2>

                                <p><span class="label label-success">POPULAR</span></p>
                                <ul>
                                    <li>Scalable</li>
                                    <li>Count as Minute, pay less</li>
                                    <li>Pay as you go</li>
                                </ul>
                                <p>Pay as you go. Cheap!!</p>
                                <hr/>
                                <h3>$0.25 / minute</h3>
                                <hr/>
                                <p><button id="onDemond" class="btn btn-success btn-large"><i class="icon-ok"></i>Select plan</button></p>
                            </div>
                        </div>
                        <div class="span1 col-md-6">
                            <div class="well">
                                <h2 class="text-warning">Flat Rate</h2>

                                <p><span class="label label-success">POPULAR</span></p>
                                <ul>
                                    <li>Scalable</li>
                                    <li>Unlimited access</li>
                                    <li>24 hours</li>
                                </ul>
                                <p>Cheap As Well!!</p>
                                <hr/>
                                <h3>$250 / month</h3>
                                <hr/>
                                <p>
                                    <button id="flatRate" class="btn btn-success btn-large"><i class="icon-ok"></i> Select plan</button>
                                </p>
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 15px;">
                            <label>Choose How Many You Want : </label>
                            <select name="number">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                           <input type="text"  id="plan" name="plan"/>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <input id="post" type="submit" value="Launch" class="btn btn-primary"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>-
    </div>


  % include('templates/jslinks.tpl', title='Javascript Links')
</body>
</html>
