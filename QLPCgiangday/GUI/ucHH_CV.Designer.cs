namespace QLPCgiangday.GUI
{
    partial class ucHH_CV
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.panelHH = new System.Windows.Forms.Panel();
            this.dataCD = new System.Windows.Forms.DataGridView();
            this.STTCD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MACD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENCD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DMGIANGDAY = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnLuuHH = new DevExpress.XtraEditors.SimpleButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtDMGD = new System.Windows.Forms.TextBox();
            this.labelControl3 = new DevExpress.XtraEditors.LabelControl();
            this.txtTenCD = new System.Windows.Forms.TextBox();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.txtMACD = new System.Windows.Forms.TextBox();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.btnXoaHH = new DevExpress.XtraEditors.SimpleButton();
            this.btnSuaHH = new DevExpress.XtraEditors.SimpleButton();
            this.btnThemHH = new DevExpress.XtraEditors.SimpleButton();
            this.panelCV = new System.Windows.Forms.Panel();
            this.dataCV = new System.Windows.Forms.DataGridView();
            this.STTCV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MACV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENCV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.HESOGIAMTAI = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnLuuCV = new DevExpress.XtraEditors.SimpleButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtSTGT = new System.Windows.Forms.TextBox();
            this.labelControl4 = new DevExpress.XtraEditors.LabelControl();
            this.txtTenCV = new System.Windows.Forms.TextBox();
            this.labelControl5 = new DevExpress.XtraEditors.LabelControl();
            this.txtMaCV = new System.Windows.Forms.TextBox();
            this.labelControl6 = new DevExpress.XtraEditors.LabelControl();
            this.btnXoaCV = new DevExpress.XtraEditors.SimpleButton();
            this.btnSuaCV = new DevExpress.XtraEditors.SimpleButton();
            this.btnThemCV = new DevExpress.XtraEditors.SimpleButton();
            this.panelHH.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataCD)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.panelCV.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataCV)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnHuy
            // 
            this.btnHuy.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuy.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuy.Location = new System.Drawing.Point(624, 242);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(75, 51);
            this.btnHuy.TabIndex = 30;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // panelHH
            // 
            this.panelHH.BackColor = System.Drawing.Color.Transparent;
            this.panelHH.Controls.Add(this.dataCD);
            this.panelHH.Controls.Add(this.btnLuuHH);
            this.panelHH.Controls.Add(this.groupBox1);
            this.panelHH.Controls.Add(this.btnXoaHH);
            this.panelHH.Controls.Add(this.btnSuaHH);
            this.panelHH.Controls.Add(this.btnThemHH);
            this.panelHH.Location = new System.Drawing.Point(62, 21);
            this.panelHH.Name = "panelHH";
            this.panelHH.Size = new System.Drawing.Size(532, 557);
            this.panelHH.TabIndex = 37;
            // 
            // dataCD
            // 
            this.dataCD.AllowUserToAddRows = false;
            this.dataCD.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataCD.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STTCD,
            this.MACD,
            this.TENCD,
            this.DMGIANGDAY});
            this.dataCD.Location = new System.Drawing.Point(81, 304);
            this.dataCD.Name = "dataCD";
            this.dataCD.Size = new System.Drawing.Size(416, 229);
            this.dataCD.TabIndex = 31;
            this.dataCD.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataHH_CellClick);
            this.dataCD.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dataHH_RowPrePaint);
            this.dataCD.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataHH_KeyDown);
            this.dataCD.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataHH_KeyDown);
            // 
            // STTCD
            // 
            this.STTCD.HeaderText = "STT";
            this.STTCD.Name = "STTCD";
            this.STTCD.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.STTCD.Width = 30;
            // 
            // MACD
            // 
            this.MACD.DataPropertyName = "MACD";
            this.MACD.HeaderText = "Mã chức danh";
            this.MACD.Name = "MACD";
            this.MACD.Width = 60;
            // 
            // TENCD
            // 
            this.TENCD.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TENCD.DataPropertyName = "TENCD";
            this.TENCD.HeaderText = "Tên chức danh";
            this.TENCD.Name = "TENCD";
            // 
            // DMGIANGDAY
            // 
            this.DMGIANGDAY.DataPropertyName = "DMGIANGDAY";
            this.DMGIANGDAY.HeaderText = "Định mức giảng dạy";
            this.DMGIANGDAY.Name = "DMGIANGDAY";
            this.DMGIANGDAY.Width = 50;
            // 
            // btnLuuHH
            // 
            this.btnLuuHH.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuuHH.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuuHH.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuuHH.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuuHH.Location = new System.Drawing.Point(422, 221);
            this.btnLuuHH.Name = "btnLuuHH";
            this.btnLuuHH.Size = new System.Drawing.Size(75, 51);
            this.btnLuuHH.TabIndex = 35;
            this.btnLuuHH.Text = "Lưu";
            this.btnLuuHH.Click += new System.EventHandler(this.btnLuuHH_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtDMGD);
            this.groupBox1.Controls.Add(this.labelControl3);
            this.groupBox1.Controls.Add(this.txtTenCD);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.Controls.Add(this.txtMACD);
            this.groupBox1.Controls.Add(this.labelControl1);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(50, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(466, 189);
            this.groupBox1.TabIndex = 30;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CHỨC DANH";
            // 
            // txtDMGD
            // 
            this.txtDMGD.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDMGD.Location = new System.Drawing.Point(221, 149);
            this.txtDMGD.Name = "txtDMGD";
            this.txtDMGD.Size = new System.Drawing.Size(197, 26);
            this.txtDMGD.TabIndex = 5;
            // 
            // labelControl3
            // 
            this.labelControl3.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl3.Location = new System.Drawing.Point(77, 154);
            this.labelControl3.Name = "labelControl3";
            this.labelControl3.Size = new System.Drawing.Size(132, 16);
            this.labelControl3.TabIndex = 4;
            this.labelControl3.Text = "Định mức giảng dạy:";
            // 
            // txtTenCD
            // 
            this.txtTenCD.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenCD.Location = new System.Drawing.Point(221, 102);
            this.txtTenCD.Name = "txtTenCD";
            this.txtTenCD.Size = new System.Drawing.Size(197, 26);
            this.txtTenCD.TabIndex = 3;
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(77, 107);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(99, 16);
            this.labelControl2.TabIndex = 2;
            this.labelControl2.Text = "Tên chức danh:";
            // 
            // txtMACD
            // 
            this.txtMACD.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMACD.Location = new System.Drawing.Point(221, 60);
            this.txtMACD.Name = "txtMACD";
            this.txtMACD.Size = new System.Drawing.Size(197, 26);
            this.txtMACD.TabIndex = 1;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(77, 65);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(95, 16);
            this.labelControl1.TabIndex = 0;
            this.labelControl1.Text = "Mã chức danh:";
            // 
            // btnXoaHH
            // 
            this.btnXoaHH.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoaHH.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaHH.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoaHH.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoaHH.Location = new System.Drawing.Point(306, 221);
            this.btnXoaHH.Name = "btnXoaHH";
            this.btnXoaHH.Size = new System.Drawing.Size(75, 51);
            this.btnXoaHH.TabIndex = 34;
            this.btnXoaHH.Text = "Xóa";
            this.btnXoaHH.Click += new System.EventHandler(this.btnXoaHH_Click);
            // 
            // btnSuaHH
            // 
            this.btnSuaHH.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaHH.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnSuaHH.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaHH.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaHH.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSuaHH.Location = new System.Drawing.Point(190, 221);
            this.btnSuaHH.Name = "btnSuaHH";
            this.btnSuaHH.Size = new System.Drawing.Size(75, 51);
            this.btnSuaHH.TabIndex = 33;
            this.btnSuaHH.Text = "Sửa";
            this.btnSuaHH.Click += new System.EventHandler(this.btnSuaHH_Click);
            // 
            // btnThemHH
            // 
            this.btnThemHH.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemHH.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThemHH.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThemHH.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemHH.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemHH.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThemHH.Location = new System.Drawing.Point(81, 221);
            this.btnThemHH.Name = "btnThemHH";
            this.btnThemHH.Size = new System.Drawing.Size(75, 51);
            this.btnThemHH.TabIndex = 32;
            this.btnThemHH.Text = "Thêm";
            this.btnThemHH.Click += new System.EventHandler(this.btnThemHH_Click);
            // 
            // panelCV
            // 
            this.panelCV.BackColor = System.Drawing.Color.Transparent;
            this.panelCV.Controls.Add(this.dataCV);
            this.panelCV.Controls.Add(this.btnLuuCV);
            this.panelCV.Controls.Add(this.groupBox2);
            this.panelCV.Controls.Add(this.btnXoaCV);
            this.panelCV.Controls.Add(this.btnSuaCV);
            this.panelCV.Controls.Add(this.btnThemCV);
            this.panelCV.Location = new System.Drawing.Point(714, 21);
            this.panelCV.Name = "panelCV";
            this.panelCV.Size = new System.Drawing.Size(505, 557);
            this.panelCV.TabIndex = 38;
            // 
            // dataCV
            // 
            this.dataCV.AllowUserToAddRows = false;
            this.dataCV.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataCV.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STTCV,
            this.MACV,
            this.TENCV,
            this.HESOGIAMTAI});
            this.dataCV.Location = new System.Drawing.Point(47, 305);
            this.dataCV.Name = "dataCV";
            this.dataCV.Size = new System.Drawing.Size(416, 229);
            this.dataCV.TabIndex = 38;
            this.dataCV.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataCV_CellClick);
            this.dataCV.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dataCV_RowPrePaint);
            this.dataCV.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataCV_KeyDown);
            this.dataCV.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataCV_KeyDown);
            // 
            // STTCV
            // 
            this.STTCV.HeaderText = "STT";
            this.STTCV.Name = "STTCV";
            this.STTCV.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.STTCV.Width = 30;
            // 
            // MACV
            // 
            this.MACV.DataPropertyName = "MACV";
            this.MACV.HeaderText = "Mã chức vụ";
            this.MACV.Name = "MACV";
            this.MACV.Width = 60;
            // 
            // TENCV
            // 
            this.TENCV.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TENCV.DataPropertyName = "TENCV";
            this.TENCV.HeaderText = "Tên chức vụ";
            this.TENCV.Name = "TENCV";
            // 
            // HESOGIAMTAI
            // 
            this.HESOGIAMTAI.DataPropertyName = "HESOGIAMTAI";
            this.HESOGIAMTAI.HeaderText = "Hệ số giảm tải (%)";
            this.HESOGIAMTAI.Name = "HESOGIAMTAI";
            this.HESOGIAMTAI.Width = 50;
            // 
            // btnLuuCV
            // 
            this.btnLuuCV.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnLuuCV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuuCV.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuuCV.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuuCV.Location = new System.Drawing.Point(388, 221);
            this.btnLuuCV.Name = "btnLuuCV";
            this.btnLuuCV.Size = new System.Drawing.Size(75, 51);
            this.btnLuuCV.TabIndex = 42;
            this.btnLuuCV.Text = "Lưu";
            this.btnLuuCV.Click += new System.EventHandler(this.btnLuuCV_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtSTGT);
            this.groupBox2.Controls.Add(this.labelControl4);
            this.groupBox2.Controls.Add(this.txtTenCV);
            this.groupBox2.Controls.Add(this.labelControl5);
            this.groupBox2.Controls.Add(this.txtMaCV);
            this.groupBox2.Controls.Add(this.labelControl6);
            this.groupBox2.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(22, 13);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(466, 189);
            this.groupBox2.TabIndex = 37;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "CHỨC VỤ";
            // 
            // txtSTGT
            // 
            this.txtSTGT.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSTGT.Location = new System.Drawing.Point(214, 149);
            this.txtSTGT.Name = "txtSTGT";
            this.txtSTGT.Size = new System.Drawing.Size(197, 26);
            this.txtSTGT.TabIndex = 5;
            // 
            // labelControl4
            // 
            this.labelControl4.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl4.Location = new System.Drawing.Point(77, 154);
            this.labelControl4.Name = "labelControl4";
            this.labelControl4.Size = new System.Drawing.Size(122, 16);
            this.labelControl4.TabIndex = 4;
            this.labelControl4.Text = "Hệ số giảm tải(%):";
            // 
            // txtTenCV
            // 
            this.txtTenCV.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenCV.Location = new System.Drawing.Point(214, 102);
            this.txtTenCV.Name = "txtTenCV";
            this.txtTenCV.Size = new System.Drawing.Size(197, 26);
            this.txtTenCV.TabIndex = 3;
            // 
            // labelControl5
            // 
            this.labelControl5.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl5.Location = new System.Drawing.Point(77, 107);
            this.labelControl5.Name = "labelControl5";
            this.labelControl5.Size = new System.Drawing.Size(83, 16);
            this.labelControl5.TabIndex = 2;
            this.labelControl5.Text = "Tên chức vụ:";
            // 
            // txtMaCV
            // 
            this.txtMaCV.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaCV.Location = new System.Drawing.Point(214, 60);
            this.txtMaCV.Name = "txtMaCV";
            this.txtMaCV.Size = new System.Drawing.Size(197, 26);
            this.txtMaCV.TabIndex = 1;
            // 
            // labelControl6
            // 
            this.labelControl6.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl6.Location = new System.Drawing.Point(77, 65);
            this.labelControl6.Name = "labelControl6";
            this.labelControl6.Size = new System.Drawing.Size(79, 16);
            this.labelControl6.TabIndex = 0;
            this.labelControl6.Text = "Mã chức vụ:";
            // 
            // btnXoaCV
            // 
            this.btnXoaCV.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnXoaCV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaCV.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoaCV.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoaCV.Location = new System.Drawing.Point(272, 221);
            this.btnXoaCV.Name = "btnXoaCV";
            this.btnXoaCV.Size = new System.Drawing.Size(75, 51);
            this.btnXoaCV.TabIndex = 41;
            this.btnXoaCV.Text = "Xóa";
            this.btnXoaCV.Click += new System.EventHandler(this.btnXoaCV_Click);
            // 
            // btnSuaCV
            // 
            this.btnSuaCV.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaCV.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnSuaCV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaCV.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaCV.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSuaCV.Location = new System.Drawing.Point(156, 221);
            this.btnSuaCV.Name = "btnSuaCV";
            this.btnSuaCV.Size = new System.Drawing.Size(75, 51);
            this.btnSuaCV.TabIndex = 40;
            this.btnSuaCV.Text = "Sửa";
            this.btnSuaCV.Click += new System.EventHandler(this.btnSuaCV_Click);
            // 
            // btnThemCV
            // 
            this.btnThemCV.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemCV.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThemCV.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D;
            this.btnThemCV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemCV.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemCV.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThemCV.Location = new System.Drawing.Point(47, 221);
            this.btnThemCV.Name = "btnThemCV";
            this.btnThemCV.Size = new System.Drawing.Size(75, 51);
            this.btnThemCV.TabIndex = 39;
            this.btnThemCV.Text = "Thêm";
            this.btnThemCV.Click += new System.EventHandler(this.btnThemCV_Click);
            // 
            // ucHH_CV
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.Controls.Add(this.panelCV);
            this.Controls.Add(this.panelHH);
            this.Controls.Add(this.btnHuy);
            this.Name = "ucHH_CV";
            this.Size = new System.Drawing.Size(1340, 596);
            this.Load += new System.EventHandler(this.ucHH_CV_Load);
            this.panelHH.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataCD)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panelCV.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataCV)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private System.Windows.Forms.Panel panelHH;
        private System.Windows.Forms.DataGridView dataCD;
        private DevExpress.XtraEditors.SimpleButton btnLuuHH;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtDMGD;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private System.Windows.Forms.TextBox txtTenCD;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private System.Windows.Forms.TextBox txtMACD;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnXoaHH;
        private DevExpress.XtraEditors.SimpleButton btnSuaHH;
        private DevExpress.XtraEditors.SimpleButton btnThemHH;
        private System.Windows.Forms.Panel panelCV;
        private System.Windows.Forms.DataGridView dataCV;
        private DevExpress.XtraEditors.SimpleButton btnLuuCV;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtSTGT;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private System.Windows.Forms.TextBox txtTenCV;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private System.Windows.Forms.TextBox txtMaCV;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.SimpleButton btnXoaCV;
        private DevExpress.XtraEditors.SimpleButton btnSuaCV;
        private DevExpress.XtraEditors.SimpleButton btnThemCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn STTCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn MACV;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn HESOGIAMTAI;
        private System.Windows.Forms.DataGridViewTextBoxColumn STTCD;
        private System.Windows.Forms.DataGridViewTextBoxColumn MACD;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENCD;
        private System.Windows.Forms.DataGridViewTextBoxColumn DMGIANGDAY;
    }
}
