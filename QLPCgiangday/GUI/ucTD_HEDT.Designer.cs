namespace QLPCgiangday.GUI
{
    partial class ucTD_HEDT
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
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtTENHE = new System.Windows.Forms.TextBox();
            this.labelControl5 = new DevExpress.XtraEditors.LabelControl();
            this.txtMAHE = new System.Windows.Forms.TextBox();
            this.labelControl6 = new DevExpress.XtraEditors.LabelControl();
            this.dataTD = new System.Windows.Forms.DataGridView();
            this.STTTD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MATD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENTD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtTenTD = new System.Windows.Forms.TextBox();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.txtMATD = new System.Windows.Forms.TextBox();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.panelHE = new System.Windows.Forms.Panel();
            this.dataHE = new System.Windows.Forms.DataGridView();
            this.STTHE = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MAHEDT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TENHEDT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnLuuHE = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoaHE = new DevExpress.XtraEditors.SimpleButton();
            this.btnSuaHE = new DevExpress.XtraEditors.SimpleButton();
            this.btnThemHE = new DevExpress.XtraEditors.SimpleButton();
            this.panelTD = new System.Windows.Forms.Panel();
            this.btnLuuTD = new DevExpress.XtraEditors.SimpleButton();
            this.btnXoaTD = new DevExpress.XtraEditors.SimpleButton();
            this.btnSuaTD = new DevExpress.XtraEditors.SimpleButton();
            this.btnThemTD = new DevExpress.XtraEditors.SimpleButton();
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataTD)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.panelHE.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataHE)).BeginInit();
            this.panelTD.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtTENHE);
            this.groupBox2.Controls.Add(this.labelControl5);
            this.groupBox2.Controls.Add(this.txtMAHE);
            this.groupBox2.Controls.Add(this.labelControl6);
            this.groupBox2.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(7, 13);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(524, 189);
            this.groupBox2.TabIndex = 37;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "HỆ ĐÀO TẠO";
            // 
            // txtTENHE
            // 
            this.txtTENHE.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTENHE.Location = new System.Drawing.Point(168, 127);
            this.txtTENHE.Name = "txtTENHE";
            this.txtTENHE.Size = new System.Drawing.Size(197, 26);
            this.txtTENHE.TabIndex = 3;
            // 
            // labelControl5
            // 
            this.labelControl5.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl5.Location = new System.Drawing.Point(31, 132);
            this.labelControl5.Name = "labelControl5";
            this.labelControl5.Size = new System.Drawing.Size(102, 16);
            this.labelControl5.TabIndex = 2;
            this.labelControl5.Text = "Tên hệ đào tạo:";
            // 
            // txtMAHE
            // 
            this.txtMAHE.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMAHE.Location = new System.Drawing.Point(168, 60);
            this.txtMAHE.Name = "txtMAHE";
            this.txtMAHE.Size = new System.Drawing.Size(197, 26);
            this.txtMAHE.TabIndex = 1;
            // 
            // labelControl6
            // 
            this.labelControl6.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl6.Location = new System.Drawing.Point(31, 65);
            this.labelControl6.Name = "labelControl6";
            this.labelControl6.Size = new System.Drawing.Size(98, 16);
            this.labelControl6.TabIndex = 0;
            this.labelControl6.Text = "Mã hệ đào tạo:";
            // 
            // dataTD
            // 
            this.dataTD.AllowUserToAddRows = false;
            this.dataTD.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataTD.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STTTD,
            this.MATD,
            this.TENTD});
            this.dataTD.Location = new System.Drawing.Point(54, 269);
            this.dataTD.Name = "dataTD";
            this.dataTD.Size = new System.Drawing.Size(416, 153);
            this.dataTD.TabIndex = 31;
            this.dataTD.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataTD_CellClick);
            this.dataTD.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dataTD_RowPrePaint);
            this.dataTD.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataTD_KeyDown);
            this.dataTD.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataTD_KeyDown);
            // 
            // STTTD
            // 
            this.STTTD.HeaderText = "STT";
            this.STTTD.Name = "STTTD";
            this.STTTD.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.STTTD.Width = 30;
            // 
            // MATD
            // 
            this.MATD.DataPropertyName = "MATD";
            this.MATD.HeaderText = "Mã trình độ";
            this.MATD.Name = "MATD";
            // 
            // TENTD
            // 
            this.TENTD.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TENTD.DataPropertyName = "TENTD";
            this.TENTD.HeaderText = "Tên trình độ";
            this.TENTD.Name = "TENTD";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtTenTD);
            this.groupBox1.Controls.Add(this.labelControl2);
            this.groupBox1.Controls.Add(this.txtMATD);
            this.groupBox1.Controls.Add(this.labelControl1);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(4, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(524, 189);
            this.groupBox1.TabIndex = 30;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "TRÌNH ĐỘ ĐÀO TẠO";
            // 
            // txtTenTD
            // 
            this.txtTenTD.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenTD.Location = new System.Drawing.Point(175, 129);
            this.txtTenTD.Name = "txtTenTD";
            this.txtTenTD.Size = new System.Drawing.Size(197, 26);
            this.txtTenTD.TabIndex = 3;
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Location = new System.Drawing.Point(31, 134);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(83, 16);
            this.labelControl2.TabIndex = 2;
            this.labelControl2.Text = "Tên trình độ:";
            // 
            // txtMATD
            // 
            this.txtMATD.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMATD.Location = new System.Drawing.Point(175, 60);
            this.txtMATD.Name = "txtMATD";
            this.txtMATD.Size = new System.Drawing.Size(197, 26);
            this.txtMATD.TabIndex = 1;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Location = new System.Drawing.Point(31, 65);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(79, 16);
            this.labelControl1.TabIndex = 0;
            this.labelControl1.Text = "Mã trình độ:";
            // 
            // panelHE
            // 
            this.panelHE.BackColor = System.Drawing.Color.Transparent;
            this.panelHE.Controls.Add(this.dataHE);
            this.panelHE.Controls.Add(this.btnLuuHE);
            this.panelHE.Controls.Add(this.groupBox2);
            this.panelHE.Controls.Add(this.btnXoaHE);
            this.panelHE.Controls.Add(this.btnSuaHE);
            this.panelHE.Controls.Add(this.btnThemHE);
            this.panelHE.Location = new System.Drawing.Point(660, 51);
            this.panelHE.Name = "panelHE";
            this.panelHE.Size = new System.Drawing.Size(538, 435);
            this.panelHE.TabIndex = 41;
            // 
            // dataHE
            // 
            this.dataHE.AllowUserToAddRows = false;
            this.dataHE.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataHE.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.STTHE,
            this.MAHEDT,
            this.TENHEDT});
            this.dataHE.Location = new System.Drawing.Point(78, 269);
            this.dataHE.Name = "dataHE";
            this.dataHE.Size = new System.Drawing.Size(379, 153);
            this.dataHE.TabIndex = 38;
            this.dataHE.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataHE_CellClick);
            this.dataHE.RowPrePaint += new System.Windows.Forms.DataGridViewRowPrePaintEventHandler(this.dataHE_RowPrePaint);
            this.dataHE.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataHE_KeyDown);
            this.dataHE.KeyUp += new System.Windows.Forms.KeyEventHandler(this.dataHE_KeyDown);
            // 
            // STTHE
            // 
            this.STTHE.HeaderText = "STT";
            this.STTHE.Name = "STTHE";
            this.STTHE.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.STTHE.Width = 30;
            // 
            // MAHEDT
            // 
            this.MAHEDT.DataPropertyName = "MAHEDT";
            this.MAHEDT.HeaderText = "Mã hệ ĐT";
            this.MAHEDT.Name = "MAHEDT";
            // 
            // TENHEDT
            // 
            this.TENHEDT.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.TENHEDT.DataPropertyName = "TENHEDT";
            this.TENHEDT.HeaderText = "Tên hệ ĐT";
            this.TENHEDT.Name = "TENHEDT";
            // 
            // btnLuuHE
            // 
            this.btnLuuHE.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuuHE.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuuHE.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuuHE.Location = new System.Drawing.Point(398, 203);
            this.btnLuuHE.Name = "btnLuuHE";
            this.btnLuuHE.Size = new System.Drawing.Size(75, 51);
            this.btnLuuHE.TabIndex = 42;
            this.btnLuuHE.Text = "Lưu";
            this.btnLuuHE.Click += new System.EventHandler(this.btnLuuHE_Click);
            // 
            // btnXoaHE
            // 
            this.btnXoaHE.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaHE.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoaHE.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoaHE.Location = new System.Drawing.Point(282, 203);
            this.btnXoaHE.Name = "btnXoaHE";
            this.btnXoaHE.Size = new System.Drawing.Size(75, 51);
            this.btnXoaHE.TabIndex = 41;
            this.btnXoaHE.Text = "Xóa";
            this.btnXoaHE.Click += new System.EventHandler(this.btnXoaHE_Click);
            // 
            // btnSuaHE
            // 
            this.btnSuaHE.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaHE.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaHE.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaHE.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSuaHE.Location = new System.Drawing.Point(166, 203);
            this.btnSuaHE.Name = "btnSuaHE";
            this.btnSuaHE.Size = new System.Drawing.Size(75, 51);
            this.btnSuaHE.TabIndex = 40;
            this.btnSuaHE.Text = "Sửa";
            this.btnSuaHE.Click += new System.EventHandler(this.btnSuaHE_Click);
            // 
            // btnThemHE
            // 
            this.btnThemHE.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemHE.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThemHE.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemHE.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemHE.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThemHE.Location = new System.Drawing.Point(57, 203);
            this.btnThemHE.Name = "btnThemHE";
            this.btnThemHE.Size = new System.Drawing.Size(75, 51);
            this.btnThemHE.TabIndex = 39;
            this.btnThemHE.Text = "Thêm";
            this.btnThemHE.Click += new System.EventHandler(this.btnThemHE_Click);
            // 
            // panelTD
            // 
            this.panelTD.BackColor = System.Drawing.Color.Transparent;
            this.panelTD.Controls.Add(this.dataTD);
            this.panelTD.Controls.Add(this.btnLuuTD);
            this.panelTD.Controls.Add(this.groupBox1);
            this.panelTD.Controls.Add(this.btnXoaTD);
            this.panelTD.Controls.Add(this.btnSuaTD);
            this.panelTD.Controls.Add(this.btnThemTD);
            this.panelTD.Location = new System.Drawing.Point(41, 51);
            this.panelTD.Name = "panelTD";
            this.panelTD.Size = new System.Drawing.Size(532, 435);
            this.panelTD.TabIndex = 40;
            // 
            // btnLuuTD
            // 
            this.btnLuuTD.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuuTD.Image = global::QLPCgiangday.Properties.Resources.save;
            this.btnLuuTD.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnLuuTD.Location = new System.Drawing.Point(395, 203);
            this.btnLuuTD.Name = "btnLuuTD";
            this.btnLuuTD.Size = new System.Drawing.Size(75, 51);
            this.btnLuuTD.TabIndex = 35;
            this.btnLuuTD.Text = "Lưu";
            this.btnLuuTD.Click += new System.EventHandler(this.btnLuuTD_Click);
            // 
            // btnXoaTD
            // 
            this.btnXoaTD.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaTD.Image = global::QLPCgiangday.Properties.Resources.gnome_edit_delete_1_;
            this.btnXoaTD.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnXoaTD.Location = new System.Drawing.Point(279, 203);
            this.btnXoaTD.Name = "btnXoaTD";
            this.btnXoaTD.Size = new System.Drawing.Size(75, 51);
            this.btnXoaTD.TabIndex = 34;
            this.btnXoaTD.Text = "Xóa";
            this.btnXoaTD.Click += new System.EventHandler(this.btnXoaTD_Click);
            // 
            // btnSuaTD
            // 
            this.btnSuaTD.BackgroundImage = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaTD.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaTD.Image = global::QLPCgiangday.Properties.Resources.edit;
            this.btnSuaTD.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnSuaTD.Location = new System.Drawing.Point(163, 203);
            this.btnSuaTD.Name = "btnSuaTD";
            this.btnSuaTD.Size = new System.Drawing.Size(75, 51);
            this.btnSuaTD.TabIndex = 33;
            this.btnSuaTD.Text = "Sửa";
            this.btnSuaTD.Click += new System.EventHandler(this.btnSuaTD_Click);
            // 
            // btnThemTD
            // 
            this.btnThemTD.BackgroundImage = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemTD.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnThemTD.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemTD.Image = global::QLPCgiangday.Properties.Resources.button_white_add;
            this.btnThemTD.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnThemTD.Location = new System.Drawing.Point(54, 203);
            this.btnThemTD.Name = "btnThemTD";
            this.btnThemTD.Size = new System.Drawing.Size(75, 51);
            this.btnThemTD.TabIndex = 32;
            this.btnThemTD.Text = "Thêm";
            this.btnThemTD.Click += new System.EventHandler(this.btnThemTD_Click);
            // 
            // btnHuy
            // 
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.Image = global::QLPCgiangday.Properties.Resources.remove;
            this.btnHuy.ImageLocation = DevExpress.XtraEditors.ImageLocation.TopCenter;
            this.btnHuy.Location = new System.Drawing.Point(579, 263);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(75, 51);
            this.btnHuy.TabIndex = 39;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // ucTD_HEDT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panelHE);
            this.Controls.Add(this.panelTD);
            this.Controls.Add(this.btnHuy);
            this.Name = "ucTD_HEDT";
            this.Size = new System.Drawing.Size(1234, 537);
            this.Load += new System.EventHandler(this.ucTD_HEDT_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataTD)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panelHE.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataHE)).EndInit();
            this.panelTD.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private DevExpress.XtraEditors.SimpleButton btnXoaTD;
        private DevExpress.XtraEditors.SimpleButton btnSuaTD;
        private DevExpress.XtraEditors.SimpleButton btnLuuHE;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtTENHE;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private System.Windows.Forms.TextBox txtMAHE;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.SimpleButton btnLuuTD;
        private System.Windows.Forms.DataGridView dataTD;
        private DevExpress.XtraEditors.SimpleButton btnXoaHE;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtTenTD;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private System.Windows.Forms.TextBox txtMATD;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnThemHE;
        private DevExpress.XtraEditors.SimpleButton btnThemTD;
        private System.Windows.Forms.Panel panelHE;
        private System.Windows.Forms.DataGridView dataHE;
        private DevExpress.XtraEditors.SimpleButton btnSuaHE;
        private System.Windows.Forms.Panel panelTD;
        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private System.Windows.Forms.DataGridViewTextBoxColumn STTTD;
        private System.Windows.Forms.DataGridViewTextBoxColumn MATD;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENTD;
        private System.Windows.Forms.DataGridViewTextBoxColumn STTHE;
        private System.Windows.Forms.DataGridViewTextBoxColumn MAHEDT;
        private System.Windows.Forms.DataGridViewTextBoxColumn TENHEDT;
    }
}
