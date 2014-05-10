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
        <h1 class="page-header">Billing</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
<div class="col-lg-12">

<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-bar-chart-o fa-fw"></i> Billing History
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
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Amount</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>3326</td>
                            <td>10/21/2013</td>
                            <td>3:29 PM</td>
                            <td>$321.33</td>
                        </tr>
                        <tr>
                            <td>3325</td>
                            <td>10/21/2013</td>
                            <td>3:20 PM</td>
                            <td>$234.34</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.table-responsive -->
            </div>
            <!-- /.col-lg-4 (nested) -->
            <div class="col-lg-8">
                <div id="morris-bar-chart"></div>
            </div>
            <!-- /.col-lg-8 (nested) -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->
</div>
<!-- /.col-lg-8 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <address>
                    <strong>Elf Cafe</strong>
                    <br>
                    2135 Sunset Blvd
                    <br>
                    Los Angeles, CA 90026
                    <br>
                    <abbr title="Phone">P:</abbr> (213) 484-6829
                </address>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                <p>
                    <em>Date: 1st November, 2013</em>
                </p>

                <p>
                    <em>Receipt #: 34522677W</em>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="text-center">
                <h1>Receipt</h1>
            </div>
        </span>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Product</th>
                <th>#</th>
                <th class="text-center">Price</th>
                <th class="text-center">Total</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="col-md-9"><em>Baked Rodopa Sheep Feta</em></h4>
            </td>
            <td class="col-md-1" style="text-align: center"> 2</td>
            <td class="col-md-1 text-center">$13</td>
            <td class="col-md-1 text-center">$26</td>
            </tr>
            <tr>
                <td class="col-md-9"><em>Lebanese Cabbage Salad</em></h4>
            </td>
            <td class="col-md-1" style="text-align: center"> 1</td>
            <td class="col-md-1 text-center">$8</td>
            <td class="col-md-1 text-center">$8</td>
        </tr>
        <tr>
            <td class="col-md-9"><em>Baked Tart with Thyme and Garlic</em></h4>
        </td>
        <td class="col-md-1" style="text-align: center"> 3</td>
        <td class="col-md-1 text-center">$16</td>
        <td class="col-md-1 text-center">$48</td>
    </tr>
    <tr>
        <td>  </td>
        <td>  </td>
        <td class="text-right">
            <p>
                <strong>Subtotal: </strong>
            </p>

            <p>
                <strong>Tax: </strong>
            </p></td>
        <td class="text-center">
            <p>
                <strong>$6.94</strong>
            </p>

            <p>
                <strong>$6.94</strong>
            </p></td>
    </tr>
    <tr>
        <td>  </td>
        <td>  </td>
        <td class="text-right"><h4><strong>Total: </strong></h4></td>
        <td class="text-center text-danger"><h4><strong>$31.53</strong></h4></td>
    </tr>
</tbody>
</table>
<button type="button" class="btn btn-success btn-lg btn-block">
    Pay Now   <span class="glyphicon glyphicon-chevron-right"></span>
</button>
</td>
</div>
</div>
        </div>
        <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        % include('templates/jslinks.tpl', title='Javascript Links')
        </body>

        </html>
