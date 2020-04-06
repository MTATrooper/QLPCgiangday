namespace QLPCgiangday.GUI
{
    partial class ucImportATTT
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
            this.dataPC_ATTT = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_ATTT)).BeginInit();
            this.SuspendLayout();
            // 
            // dataPC_ATTT
            // 
            this.dataPC_ATTT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataPC_ATTT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataPC_ATTT.Location = new System.Drawing.Point(0, 0);
            this.dataPC_ATTT.Name = "dataPC_ATTT";
            this.dataPC_ATTT.Size = new System.Drawing.Size(945, 443);
            this.dataPC_ATTT.TabIndex = 1;
            // 
            // ucImportATTT
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.dataPC_ATTT);
            this.Name = "ucImportATTT";
            this.Size = new System.Drawing.Size(945, 443);
            this.Load += new System.EventHandler(this.ucImportATTT_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataPC_ATTT)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataPC_ATTT;
    }
}
